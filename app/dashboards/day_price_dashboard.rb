require "administrate/base_dashboard"

class DayPriceDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    station: Field::BelongsTo,
    id: Field::Number,
    day: Field::Number,
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
    :station,
    :id,
    :day,
    :biodiesel,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :station,
    :id,
    :day,
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
    :station,
    :day,
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

  # Overwrite this method to customize how day prices are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(day_price)
  #   "DayPrice ##{day_price.id}"
  # end
end
