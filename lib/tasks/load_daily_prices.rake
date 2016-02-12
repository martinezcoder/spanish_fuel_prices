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
    data["ListaEESSPrecio"].each do |station|
      StationDatum.create! do |s|
        s.postal_code = station["C.P."]
        s.address= station["Dirección"]
        s.opening_hours= station["Horario"]
        s.latitude= custom_integer(station["Latitud"])
        s.longitud = custom_integer(station["Longitud (WGS84)"])
        s.location= station["Localidad"]
        s.municipality = station["Municipio"]
        s.province = station["Provincia"]
        s.margin = station["Margen"]
        s.remission = station["Remisión"]
        s.label = station["Rótulo"]
        s.sales_type = station["Tipo Venta"]
        s.biodiesel = custom_integer(station["Precio Biodiesel"])
        s.bioetanol = custom_integer(station["Precio Bioetanol"])
        s.compressed_natural_gas = custom_integer(station["Precio Gas Natural Comprimido"])
        s.liquefied_natural_gas = custom_integer(station["Precio Gas Natural Licuado"])
        s.a_diesel = custom_integer(station["Precio Gasoleo A"])
        s.gasoline_95 = custom_integer(station["Precio Gasolina 95 Protección"])
        s.gasoline_98 = custom_integer(station["Precio Gasolina  98"])
        s.new_a_diesel = custom_integer(station["Precio Nuevo Gasoleo A"])
        s.bioetanol_per = custom_integer(station["% BioEtanol"])
        s.methyl_ester_per = custom_integer(station["% Éster metílico"])
      end
    end
  end

  def custom_integer(string_number)
    return nil if string_number.nil?
    string_number.delete!(",").to_i
  end
end
