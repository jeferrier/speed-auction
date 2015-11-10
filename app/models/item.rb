class Item < ActiveRecord::Base
  belongs_to :user
  has_one :auction
  validates_attachment_content_type :headline_image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates_attachment_presence :headline_image
end
