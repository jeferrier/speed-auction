class CreateBillingInfos < ActiveRecord::Migration
  def change
    create_table :billing_infos do |t|

      t.belongs_to :payment_detail, index: true
      t.string :name
      t.string :street_address
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone_number
      t.string :email_address

      t.timestamps
    end
  end
end
