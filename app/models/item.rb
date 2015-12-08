class Item < ActiveRecord::Base
  belongs_to :user
  has_one :auction
  has_attached_file :headline_image
  validates_attachment_content_type :headline_image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates_attachment_presence :headline_image
  validates :name, presence: true, length: { maximum: 256 }
  validates :description, presence: true, length: { maximum: 1024 }
  validates :starting_price, presence: true, numericality: {greater_than: 0}, length: { maximum: 32 }
  validates :street_address, presence: true, length: { maximum: 32 }
  validates :city, presence: true, length: { maximum: 15 }
  validates :state, presence: true, length: { is: 2 }
  validates :zip, presence: true, length: { is: 5 }, numericality: { only_integer: true }
end
