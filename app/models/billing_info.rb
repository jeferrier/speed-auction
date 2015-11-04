class BillingInfo < ActiveRecord::Base
  belongs_to :payment_detail
end
