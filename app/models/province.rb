class Province < ActiveRecord::Base
  has_many :municipalities
  # belongs_to :ccaa
end
