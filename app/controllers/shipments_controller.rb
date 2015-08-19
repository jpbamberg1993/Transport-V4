class ShipmentsController < ApplicationController
  before_filter :require_permission, only: [:edit, :update, :destroy]
  before_action :set_shipment, only: [:show, :edit, :update, :destroy]

  # GET /shipments
  # GET /shipments.json
  def index
    @shipments = filtered_shipments
    current_user
  end

  # GET /shipments/1
  # GET /shipments/1.json
  def show
    @offer = Offer.new
    #@offers =
  end

  # GET /shipments/new
  def new
    @shipment = Shipment.new
  end

  # GET /shipments/1/edit
  def edit
  end

  # def accept_bid(offer)
  #   if current_user.shipper?
  #     f.label :accepted
  #     f.check_box :accepted
  #   else
  #     puts 'working'
  #   end
  # end

  # Accept highest offer button
  def activate
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    redirect_to "shipments?approved=true"
  end

  # POST /shipments
  # POST /shipments.json
  def create
    @shipment = Shipment.new(shipment_params.merge(user: current_user))

    respond_to do |format|
      if @shipment.save
        format.html { redirect_to @shipment, notice: 'Shipment was successfully created.' }
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

  # DELETE /shipments/1
  # DELETE /shipments/1.json
  def destroy
    @shipment.destroy
    respond_to do |format|
      format.html { redirect_to shipments_url, notice: 'Shipment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shipment
      @shipment = Shipment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shipment_params
      params.require(:shipment).permit(:origin, :destination, :mode_of_transportation, :equipment_type, :minimum_commitment, :maximum_commitment, :cost, :user)
    end

  def require_permission
    if current_user != Shipment.find(params[:id]).user
      redirect_to root_path
    end
  end

  def filtered_shipments
    if current_user.carrier?
      Shipment.all
    else
      Shipment.where( user_id: @current_user.id)
    end
  end
end
