class Station < ActiveRecord::Base
  has_many :day_prices
  belongs_to :location
  belongs_to :municipality
  belongs_to :province
end
