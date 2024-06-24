class Spell < ApplicationRecord
  # string : name
  # string : url
  # integer: level
  # string : desc

  has_and_belongs_to_many :clases
  has_and_belongs_to_many :magicschools

  def self.source_update 
    das = DndApiService.new
    allCurr = Spell.all.pluck(:name)
    das.fetch_spells.each do |name, index|
      if not allCurr.include?(name)
        sp = das.fetch_spell(index)
        Spell.create(
          name: sp["name"],
          url: "https://www.dnd5eapi.co#{sp["url"]}", 
          level: sp["level"], 
          desc: "#{sp["desc"].join(" ")} #{sp["higher_level"].join(" ")} "\
            "Rango: #{sp["range"]}. Material: #{sp["material"]}. "\
            "#{sp["area_of_effect"] ? "Área de efecto: #{sp["area_of_effect"]["type"]}, #{sp["size"]}. " : ""}"\
            "#{sp["ritual"] ? "Ritual.": ""} #{sp["concentration"] ? "Concentración." : ""} "\
            "Tiempo de lanzamiento: #{sp["casting_time"]}. Tipo de ataque: #{sp["attack_type"]}. "\
            "#{sp["damage"] ? "Daño: #{sp["damage"]["damage_type"] ? sp["damage"]["damage_type"]["name"] : ""}, #{sp["damage"]["damage_at_slot_level"]}. " : ""}",
          clases: sp["classes"].map{ |clase| Clase.find_or_create_by(nombre: clase["name"]) }, 
          magicschools: [Magicschool.find_or_create_by(nombre: sp["school"]["name"])]
        )

      end
    end
  end

  Spell.source_update

end
