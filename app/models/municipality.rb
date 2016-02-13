class Municipality < ActiveRecord::Base
  has_many :locations
  belongs_to :province
end
