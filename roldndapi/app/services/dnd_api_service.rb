class DndApiService
  include HTTParty
  base_uri 'https://www.dnd5eapi.co/api' # Reemplaza con la URL de la API externa

  def fetch_spells
    response = self.class.get('/spells') # Ajusta el endpoint según la API externa
    allspells = {}
    if response.success?
      response.parsed_response["results"].each do |spell|
        allspells[spell["name"]] = spell["index"]
      end
      allspells   
    else
      raise "Error al obtener datos de la API"
    end
  end

  def fetch_spell(index)
    response = self.class.get("/spells/#{index}") # Ajusta el endpoint según la API externa
    if response.success?
        response.parsed_response
    else
      raise "Error al obtener datos de la API"
    end
  end
end