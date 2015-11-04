class PaymentDetail < ActiveRecord::Base
  belongs_to :user
  has_one :billing_info
end
