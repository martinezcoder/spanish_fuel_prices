class Location < ActiveRecord::Base
  has_many :stations
  belongs_to :municipality
end
