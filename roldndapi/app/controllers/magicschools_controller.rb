class MagicschoolsController < ApplicationController
  def index
    render json: Magicschool.pluck(:id, :nombre).map { |id, nombre| { name: nombre, url: "/magicschools/#{id}" } }
  end

  def show
    mc = Magicschool.find(params[:id])
    render json: {
      "name": mc.nombre,
      "spells": mc.spells.pluck(:id, :name).map { |id, name| { name: name, url: "/spells/#{id}" } }
    }
  end
end
