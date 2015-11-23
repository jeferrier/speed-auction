class AuctionsController < ApplicationController
  before_action :set_auction, only: [:show, :edit, :update, :destroy]
  before_action :show_sign_in

  def login
    application_login
    redirect_to auctions_path
  end

  # GET /auctions
  # GET /auctions.json
  def index
    @auctions = Auction.all
    @items = Item.all
    @past_auctions = []
    @future_auctions = []
    @past_items = []
    @future_items = []
    @auctions.each do |a|
      if a.end_date < DateTime.now
        @past_auctions << a
        @past_items << a.item
     else
        @future_auctions << a
        @future_items << a.item
      end
      end
  end

  def view_my_auctions
    @auctions = Auction.all
    @items = Item.all
    @past_auctions = []
    @future_auctions = []
    @past_items = []
    @future_items = []
    @auctions.each do |a|
      if a.end_date < DateTime.now
        @past_auctions << a
        @past_items << a.item
     else
        @future_auctions << a
        @future_items << a.item
      end
      end
    @user = User.find_by(session_id: session[:user_cred])
  end
  
  def view_auction
    @current_auction = Auction.find_by(id: params[:auction_id])
    @current_item = @current_auction.item
  end

  def mark_delivered
    @current_auction = Auction.find_by(id: params[:auction_id])
    @current_auction.item.delivered = true
    @current_auction.item.save
    
    respond_to do |format|
        format.html { head :no_content }
        format.js   { render :delivered_success }
        format.json { head :no_content }
      end
      
  end
  
  def flag
    @auction = Auction.find_by(id: params[:auction_id])
    @auction.flagged = true
    @auction.save

    respond_to do |format|
      format.html { head :no_content }
      format.js   { head :no_content }
      format.json { head :no_content }
    end
  end
  
  def bid
    
    @auction = Auction.find_by(id: params[:auction_id])
    @amount = params[:bid][1...-1].to_f
    
    unless @auction.current_bid > @amount || @user.id == @auction.item.user_id
      @auction.bidder_id = @user.id
      @auction.current_bid = @amount
      @auction.save

      respond_to do |format|
        format.html { head :no_content }
        format.js   { render :bid_success }
        format.json { head :no_content }
      end

    else

      @amount = @auction.current_bid

      respond_to do |format|
        format.html { head :no_content }
        format.js   { render :bid_failure }
        format.json { head :no_content }
      end

    end
   
  end

  def admin_index
  end

  # GET /auctions/1
  # GET /auctions/1.json
  def show
  end

  # GET /auctions/new
  def new
    @auction = Auction.new
  end

  # GET /auctions/1/edit
  def edit
  end

  # POST /auctions
  # POST /auctions.json
  def create
    @auction = Auction.new(auction_params)

    respond_to do |format|
      if @auction.save
        format.html { redirect_to @auction, notice: 'Auction was successfully created.' }
        format.json { render :show, status: :created, location: @auction }
      else
        format.html { render :new }
        format.json { render json: @auction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /auctions/1
  # PATCH/PUT /auctions/1.json
  def update
    respond_to do |format|
      if @auction.update(auction_params)
        format.html { redirect_to @auction, notice: 'Auction was successfully updated.' }
        format.json { render :show, status: :ok, location: @auction }
      else
        format.html { render :edit }
        format.json { render json: @auction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /auctions/1
  # DELETE /auctions/1.json
  def destroy
    @auction.destroy
    respond_to do |format|
      format.html { redirect_to auctions_url, notice: 'Auction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_auction
      @auction = Auction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def auction_params
      params.require(:auction).permit(:begin_date, :end_date, :current_bid, :bidder_id, :flagged, :paid)
    end
end
