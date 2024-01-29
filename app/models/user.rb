class User < ApplicationRecord
    has_secure_password

    has_many :wishlists
    has_many :games, through: :wishlists
    has_many :reviews

    validates :username, presence: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true
end
