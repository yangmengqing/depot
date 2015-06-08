class Product < ActiveRecord::Base
  default_scope { order (:title) }
  validates :title, :description, :image_url, :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :title, :uniqueness => true, length: {minimum: 10, message: 'must be longer than 10 characters'}
  validates :image_url, :format => {
    :with => %r{\.(gif|jpg|png)\z}i,
    :message => 'must be a url for gif, jpg or png image.'
  }
end
