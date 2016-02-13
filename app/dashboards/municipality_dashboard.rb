require "administrate/base_dashboard"

class MunicipalityDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    locations: Field::HasMany,
    province: Field::BelongsTo,
    id: Field::Number,
    name: Field::String,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :locations,
    :province,
    :id,
    :name,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :locations,
    :province,
    :id,
    :name,
  ]

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :locations,
    :province,
    :name,
  ]

  # Overwrite this method to customize how municipalities are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(municipality)
  #   "Municipality ##{municipality.id}"
  # end
end
