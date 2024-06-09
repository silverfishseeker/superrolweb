class Spell < ApplicationRecord

  def self.source_update 
    das = DndApiService.new
    allCurr = Spell.all.pluck(:name)
    das.fetch_spells.each do |name, index|
      if not allCurr.include?(name)
        sp = das.fetch_spell(index)
        Spell.create(
          name: sp["name"],
          index: sp["index"],
          level: sp["level"], 
          clases:
            sp["classes"].map{ |clase| clase["name"] }.join(", ") +
            (sp["subclasses"].any? ?
             ("  Subclases: " +  sp["subclasses"].map{ |clase| clase["name"] }.join(", "))
            : ""), 
          desc: "#{sp["desc"].join(" ")} #{sp["higher_level"].join(" ")} "\
            "Rango: #{sp["range"]}. Material: #{sp["material"]}. "\
            "#{sp["area_of_effect"] ? "Área de efecto: #{sp["area_of_effect"]["type"]}, #{sp["size"]}. " : ""}"\
            "#{sp["ritual"] ? "Ritual.": ""} #{sp["concentration"] ? "Concentración." : ""} "\
            "Tiempo de lanzamiento: #{sp["casting_time"]}. Tipo de ataque: #{sp["attack_type"]}. "\
            "#{sp["damage"] ? "Daño: #{sp["damage"]["damage_type"] ? sp["damage"]["damage_type"]["name"] : ""}, #{sp["damage"]["damage_at_slot_level"]}. " : ""}"\
            "Escuela: #{sp["school"]["name"]}"
        )
      end
    end
  end

  Spell.source_update

end
