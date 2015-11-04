class User < ActiveRecord::Base
  has_many :payment_details
  has_many :items
end
