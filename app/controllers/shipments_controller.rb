class ShipmentsController < ApplicationController
  before_filter :require_permission, only: [:edit, :update, :destroy]
  before_action :set_shipment, only: [:show, :edit, :update, :destroy, :add_carrier]

  def add_carrier
    @carrier = User.find params[:carrier_id]
    @shipment.user_shipments.create(
      user: @carrier,
      role: "carrier"
    )
    @offers = @shipment.offers
    render 'show'
  end

  def choose_carriers
    @shipment = Shipment.find params[:id]
    @carriers = @shipment.carriers_not_added
    #render :json => @carriers
  end

  # GET /shipments
  # GET /shipments.json
  def index
    @shipments = filtered_shipments
    current_user
  end

  # GET /shipments/1
  # GET /shipments/1.json
  def show
    @shipment = Shipment.find params[:id]
    @offer = Offer.new
    @offers = @shipment.offers # Offer.list_for_this_shipment(params[:id])
    # @shipment.offers
    @carriers = @shipment.carriers
  end

  # GET /shipments/new
  def new
    @shipment = Shipment.new
    @carriers = User.list_carriers
  end

  # GET /shipments/1/edit
  def edit
  end

  # Accept highest offer button
  def activate
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    redirect_to "shipments?approved=true"
  end

  # POST /shipments
  # POST /shipments.json
  def create
    @shipment = Shipment.new(shipment_params)
    respond_to do |format|
      if @shipment.save
        UserShipment.create( shipment_id: @shipment.id, user_id: current_user.id, role: current_user.role )
        format.html { redirect_to choose_carriers_path(@shipment), notice: 'Shipment was successfully created.' }
        format.json { render :show, status: :created, location: @shipment }
      else
        format.html { render :new }
        format.json { render json: @shipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shipments/1
  # PATCH/PUT /shipments/1.json
  def update

    carrier_ids = params[:shipment][:user_shipments_attributes]["0"][:user_id]

    # IF update called from choose_carriers page,
    # then make user_shipments
    # IF update called from edit page,
    # then update shipment
    if carrier_ids
      #@shipment.create_user_shipment_collection(carrier_ids)
      result = @shipment.create_user_shipment_collection(carrier_ids)

      respond_to do |format|
        format.html { redirect_to @shipment }
        format.json { render :json => result, status: :ok, location: @shipment }
      end
    else
      respond_to do |format|
        if @shipment.update(shipment_params)
          format.html { redirect_to @shipment, notice: 'Shipment was successfully updated.' }
          format.json { render :show, status: :ok, location: @shipment }
        else
          format.html { render :edit }
          format.json { render json: @shipment.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /shipments/1
  # DELETE /shipments/1.json
  def destroy
    @shipment.destroy
    respond_to do |format|
      format.html { redirect_to shipments_url, notice: 'Shipment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # Export data table shipments - downloads csv
  def export
    @data = Shipment.order(:created_at)
    respond_to do |format|
      format.html { redirect_to root_url }
      format.csv { send_data @data.to_csv }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shipment
      @shipment = Shipment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shipment_params
      params.require(
        :shipment
      ).permit(
        :origin,
        :destination,
        :mode_of_transportation,
        :equipment_type,
        :minimum_commitment,
        :maximum_commitment,
        :cost,
        :users,
    # => Nested UserShipment params
        :user_shipment_attributes => [
          :user_id,
          :shipment_id,
          :role
        ]
      )
    end

  def require_permission
    if current_user != Shipment.find(params[:id]).shipper
      redirect_to root_path
    end
  end

  def filtered_shipments
    if current_user.carrier?
      current_user.carrier_shipments
    else
      current_user.posted_shipments
    end
  end
end
