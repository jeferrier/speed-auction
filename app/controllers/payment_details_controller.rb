class PaymentDetailsController < ApplicationController
  before_action :set_payment_detail, only: [:show, :edit, :update, :destroy]
  before_action :show_sign_in

  # GET /payment_details
  # GET /payment_details.json
  def index 
    redirect_to root_path     
    @payment_details = PaymentDetail.all
  end

  # GET /payment_details/1
  # GET /payment_details/1.json
  def show
    redirect_to root_path
  end

  # GET /payment_details/new
  def new
    if @show_sign_in
      redirect_to root_path
    else
      if @admin != nil
        redirect_to root_path
      end
    end
    @payment_detail = PaymentDetail.new
  end

  # GET /payment_details/1/edit
  def edit
    @user = User.find_by(session_id: session[:user_cred])
    @payment_detail = PaymentDetail.find_by(id: params[:id])
    if @show_sign_in
      redirect_to root_path
    else
      if @user.payment_details.find_by(id: params[:id]) != @payment_detail
        redirect_to root_path
      end
    end
  end

  # POST /payment_details
  # POST /payment_details.json
  def create
    @payment_detail = PaymentDetail.new(payment_detail_params)
    
    
    respond_to do |format|
      if @payment_detail.save
        session[:current_payment_detail] = @payment_detail.id
        @user.payment_details << @payment_detail
        @user.save
        
        format.html { redirect_to new_billing_info_path, notice: 'Payment detail was successfully created.' }
        format.json { render :show, status: :created, location: @payment_detail }
      else
        format.html { render :new }
        format.json { render json: @payment_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payment_details/1
  # PATCH/PUT /payment_details/1.json
  def update
    respond_to do |format|
      if @payment_detail.update(payment_detail_params)
        format.html { redirect_to myaccount_path, notice: 'Payment detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @payment_detail }
      else
        format.html { render :edit }
        format.json { render json: @payment_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payment_details/1
  # DELETE /payment_details/1.json
  def destroy
    @payment_detail.destroy
    respond_to do |format|
      format.html { redirect_to payment_details_url, notice: 'Payment detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment_detail
      @payment_detail = PaymentDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def payment_detail_params
      params.require(:payment_detail).permit(:credit_card, :credit_card_number, :credit_card_expiration_date, :credit_card_security_code, :paypal, :paypal_email_address)
    end
end
