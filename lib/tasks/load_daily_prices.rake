require 'curl'
require 'json'

namespace :db do

  desc "First station load..."
  task first_load: :environment do
    puts "First load..."
    puts Time.now
    first_load_batch
    puts Time.now
    puts "done."
  end

  def first_load_batch
    http = Curl.get('https://sedeaplicaciones.minetur.gob.es/ServiciosRESTCarburantes/PreciosCarburantes/EstacionesTerrestres/')
    data = JSON.parse http.body_str
    data["ListaEESSPrecio"].each do |item|

      ActiveRecord::Base.transaction do

        province = Province.find_or_create_by!(name: item["Provincia"])
        municipality = Municipality.find_or_initialize_by(name: item["Municipio"])
        municipality.province = province
        municipality.save!

        location = Location.find_or_initialize_by(name: item["Localidad"])
        location.municipality = municipality
        location.save!

        station = Station.find_or_initialize_by(label: item["Rótulo"], latitude: custom_integer(item["Latitud"]), longitude: custom_integer(item["Longitud (WGS84)"])) do |s|
          s.postal_code = item["C.P."]
          s.address= item["Dirección"]
          s.opening_hours= item["Horario"]
        end
        station.location = location
        station.municipality = municipality
        station.province = province
        station.save!

        today = DateTime.parse(data["Fecha"]).strftime("%Y%m%d")
        day_price = DayPrice.find_or_initialize_by(day: today, station_id: station.id) do |d|
          d.biodiesel = custom_integer(item["Precio Biodiesel"])
          d.bioetanol = custom_integer(item["Precio Bioetanol"])
          d.compressed_natural_gas = custom_integer(item["Precio Gas Natural Comprimido"])
          d.liquefied_natural_gas = custom_integer(item["Precio Gas Natural Licuado"])
          d.a_diesel = custom_integer(item["Precio Gasoleo A"])
          d.gasoline_95 = custom_integer(item["Precio Gasolina 95 Protección"])
          d.gasoline_98 = custom_integer(item["Precio Gasolina  98"])
          d.new_a_diesel = custom_integer(item["Precio Nuevo Gasoleo A"])
          d.bioetanol_per = custom_integer(item["% BioEtanol"])
          d.methyl_ester_per = custom_integer(item["% Éster metílico"])
        end
        day_price.save!

        print "."
      end
=begin
      StationDatum.create! do |s|
        s.margin = station["Margen"]
        s.remission = station["Remisión"]
        s.sales_type = station["Tipo Venta"]
      end
=end
    end
  end

  def custom_integer(string_number)
    return nil if string_number.nil?
    string_number.delete!(",").to_i
  end
end
