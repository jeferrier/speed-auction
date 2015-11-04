json.array!(@auctions) do |auction|
  json.extract! auction, :id, :begin_date, :end_date, :current_bid, :bidder_id, :flagged, :paid
  json.url auction_url(auction, format: :json)
end
