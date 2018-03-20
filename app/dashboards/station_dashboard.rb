require "administrate/base_dashboard"

class StationDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    day_prices: Field::HasMany,
    location: Field::BelongsTo,
    municipality: Field::BelongsTo,
    province: Field::BelongsTo,
    id: Field::Number,
    postal_code: Field::String,
    address: Field::String,
    opening_hours: Field::String,
    latitude: Field::String,
    longitude: Field::String,
    label: Field::String,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :day_prices,
    :location,
    :municipality,
    :province,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :day_prices,
    :location,
    :municipality,
    :province,
    :id,
    :postal_code,
    :address,
    :opening_hours,
    :latitude,
    :longitude,
    :label,
  ]

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :day_prices,
    :location,
    :municipality,
    :province,
    :postal_code,
    :address,
    :opening_hours,
    :latitude,
    :longitude,
    :label,
  ]

  # Overwrite this method to customize how stations are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(station)
  #   "Station ##{station.id}"
  # end
end
