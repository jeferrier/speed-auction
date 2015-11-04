class CreateAuctions < ActiveRecord::Migration
  def change
    create_table :auctions do |t|
      t.belongs_to :item, index: true
      t.timestamp :begin_date
      t.timestamp :end_date
      t.float :current_bid
      t.string :bidder_id
      t.boolean :flagged
      t.boolean :paid

      t.timestamps
    end
  end
end
