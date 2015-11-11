class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items
  # POST /items.json
  def create
  # make a new item with the values from the _form
    @item = Item.new(item_params)
  #make a new auction using this item
  # add the auction to the item
    @auctions = Auction.all
    @auction = Auction.new()
    largest_date = DateTime.now
      
    if @auctions.empty?
      @auction.begin_date = (DateTime.now + 1.day).beginning_of_day
      @auction.end_date = @auction.begin_date + 1.day
    else
      @auctions.each do |a|
        if a.end_date > largest_date
          largest_date = a.end_date
        end
      end
       @auction.begin_date = largest_date
      @auction.end_date = @auction.begin_date + 1.day
    end

    @auction.current_bid = 0
    @auction.flagged = false
    @auction.paid = false
    @auction.save
    
    @item.auction = @auction
    
    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def item_params
      params.require(:item).permit(:headline_image, :name, :description, :starting_price, :buyout_price, :street_address, :city, :state, :zip, :delivered)
    end
end
