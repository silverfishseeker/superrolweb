class ClasesController < ApplicationController
    def index
      render json: Clase.pluck(:id, :nombre).map { |id, nombre| { name: nombre, url: "/clases/#{id}", id: id } }
    end
  
    def show
      clase = Clase.find(params[:id])
      render json: {
        "name": clase.nombre,
        "spells": clase.spells.pluck(:id, :name).map { |id, name| { name: name, url: "/spells/#{id}" } }
      }
    end
end
