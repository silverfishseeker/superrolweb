class Spell < ApplicationRecord

  # Spell.source_update

  def self.source_update 
    das = DndApiService.new
    allCurr = Spell.all.pluck(:name)
    das.fetch_spells.each do |name, index|
      if not allCurr.include?(name)
        api_spell = das.fetch_spell(index)
        Spell.create(
          name: api_spell["name"],
          url: api_spell["url"],
          level: api_spell["level"], 
          clases:
            api_spell["classes"].map{ |clase| clase["name"] }.join(", ") +
            (api_spell["subclasses"].any? ?
             ("  SUBCLASES: " +  api_spell["subclasses"].map{ |clase| clase["name"] }.join(", "))
            : ""), 
          desc: ""
        )
      end
    end
  end

end
