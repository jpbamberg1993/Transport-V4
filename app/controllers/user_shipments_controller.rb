class UserShipmentsController < ApplicationController
  before_action :set_user_shipment, only: [:show, :edit, :update, :destroy]

  # GET /user_shipments
  # GET /user_shipments.json
  def index
    @user_shipments = UserShipment.all
  end

  # GET /user_shipments/1
  # GET /user_shipments/1.json
  def show
  end

  # GET /user_shipments/new
  def new
    @user_shipment = UserShipment.new
  end

  # GET /user_shipments/1/edit
  def edit
  end

  # POST /user_shipments
  # POST /user_shipments.json
  def create
    @user_shipment = UserShipment.new(user_shipment_params)

    respond_to do |format|
      if @user_shipment.save
        UserNotifier.send_signup_email(@user).deliver
        format.html { redirect_to @user_shipment, notice: 'User shipment was successfully created.' }
        format.json { render :show, status: :created, location: @user_shipment }
        # Should send email
        @user_shipment.send_signup_email(current_user)
      else

        format.html { render :new, notice: 'User shipment was not created' }
        format.json { render json: @user_shipment.errors, status: :unprocessable_entity }
        @user_shipment.send_signup_email(current_user)
      end
    end
  end

  # PATCH/PUT /user_shipments/1
  # PATCH/PUT /user_shipments/1.json
  def update
    respond_to do |format|
      if @user_shipment.update(user_shipment_params)
        format.html { redirect_to @user_shipment, notice: 'User shipment was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_shipment }
      else
        format.html { render :edit }
        format.json { render json: @user_shipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_shipments/1
  # DELETE /user_shipments/1.json
  def destroy
    @user_shipment.destroy
    respond_to do |format|
      format.html { redirect_to user_shipments_url, notice: 'User shipment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_shipment
      @user_shipment = UserShipment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_shipment_params
      params.require(:user_shipment).permit(:user_id, :shipment_id, :role)
    end
end
