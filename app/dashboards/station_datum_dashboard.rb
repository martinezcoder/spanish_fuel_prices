require "administrate/base_dashboard"

class StationDatumDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    postal_code: Field::String,
    address: Field::String,
    opening_hours: Field::String,
    latitude: Field::Number,
    longitud: Field::Number,
    location: Field::String,
    municipality: Field::String,
    province: Field::String,
    margin: Field::String,
    remission: Field::String,
    label: Field::String,
    sales_type: Field::String,
    biodiesel: Field::Number,
    bioetanol: Field::Number,
    compressed_natural_gas: Field::Number,
    liquefied_natural_gas: Field::Number,
    a_diesel: Field::Number,
    gasoline_95: Field::Number,
    gasoline_98: Field::Number,
    new_a_diesel: Field::Number,
    bioetanol_per: Field::Number,
    methyl_ester_per: Field::Number,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :postal_code,
    :address,
    :opening_hours,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :postal_code,
    :address,
    :opening_hours,
    :latitude,
    :longitud,
    :location,
    :municipality,
    :province,
    :margin,
    :remission,
    :label,
    :sales_type,
    :biodiesel,
    :bioetanol,
    :compressed_natural_gas,
    :liquefied_natural_gas,
    :a_diesel,
    :gasoline_95,
    :gasoline_98,
    :new_a_diesel,
    :bioetanol_per,
    :methyl_ester_per,
  ]

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :postal_code,
    :address,
    :opening_hours,
    :latitude,
    :longitud,
    :location,
    :municipality,
    :province,
    :margin,
    :remission,
    :label,
    :sales_type,
    :biodiesel,
    :bioetanol,
    :compressed_natural_gas,
    :liquefied_natural_gas,
    :a_diesel,
    :gasoline_95,
    :gasoline_98,
    :new_a_diesel,
    :bioetanol_per,
    :methyl_ester_per,
  ]

  # Overwrite this method to customize how station data are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(station_datum)
  #   "StationDatum ##{station_datum.id}"
  # end
end
