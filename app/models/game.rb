class Game < ApplicationRecord
    has_many :wishlists
    has_many :users, through: :wishlists
    has_many :reviews
  
    validates :title, presence: true
    validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
