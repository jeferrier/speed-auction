class PaymentDetail < ActiveRecord::Base
  belongs_to :user
  has_one :billing_info
  validates :credit_card_number, length: { is: 16 }, presence: true, if: "credit_card.true?"
  validates :credit_card_expiration_date, length: { is: 5 }, presence: true, if: "credit_card.true?"
  validates :credit_card_security_code, length: { in: 3..4 }, presence: true, if: "credit_card.true?"
  validates :paypal_email_address, presence: true, if: "paypal.true?"
end