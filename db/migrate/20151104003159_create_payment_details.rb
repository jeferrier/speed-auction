class CreatePaymentDetails < ActiveRecord::Migration
  def change
    create_table :payment_details do |t|

      t.belongs_to :user, index: true
      t.boolean :credit_card
      t.string :credit_card_number
      t.string :credit_card_expiration_date
      t.string :credit_card_security_code
      t.boolean :paypal
      t.string :paypal_email_address

      t.timestamps
    end
  end
end
