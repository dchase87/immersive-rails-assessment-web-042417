class Episode < ApplicationRecord
  has_many :guests, through: :appearances
  has_many :appearances
end
