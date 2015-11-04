class BillingInfosController < ApplicationController
  before_action :set_billing_info, only: [:show, :edit, :update, :destroy]

  # GET /billing_infos
  # GET /billing_infos.json
  def index
    @billing_infos = BillingInfo.all
  end

  # GET /billing_infos/1
  # GET /billing_infos/1.json
  def show
  end

  # GET /billing_infos/new
  def new
    @billing_info = BillingInfo.new
  end

  # GET /billing_infos/1/edit
  def edit
  end

  # POST /billing_infos
  # POST /billing_infos.json
  def create
    @billing_info = BillingInfo.new(billing_info_params)

    respond_to do |format|
      if @billing_info.save
        format.html { redirect_to @billing_info, notice: 'Billing info was successfully created.' }
        format.json { render :show, status: :created, location: @billing_info }
      else
        format.html { render :new }
        format.json { render json: @billing_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /billing_infos/1
  # PATCH/PUT /billing_infos/1.json
  def update
    respond_to do |format|
      if @billing_info.update(billing_info_params)
        format.html { redirect_to @billing_info, notice: 'Billing info was successfully updated.' }
        format.json { render :show, status: :ok, location: @billing_info }
      else
        format.html { render :edit }
        format.json { render json: @billing_info.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /billing_infos/1
  # DELETE /billing_infos/1.json
  def destroy
    @billing_info.destroy
    respond_to do |format|
      format.html { redirect_to billing_infos_url, notice: 'Billing info was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_billing_info
      @billing_info = BillingInfo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def billing_info_params
      params.require(:billing_info).permit(:name, :street_address, :city, :state, :zip, :phone_number, :email_address)
    end
end
