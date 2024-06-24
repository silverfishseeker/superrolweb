class SpellsController < ApplicationController
  before_action :set_spell, only: %i[ show update destroy ]

  def reset
    Spell.all.each { |spell| spell.destroy }
    Spell.source_update
    index
  end
  # GET /spells
  def index
    render json: Spell.pluck(:id, :name).map { |id, name| { name: name, url: "/spells/#{id}" } }
  end

  # GET /spells/1
  def show
    render json: {
      "name": @spell.name,
      "level": @spell.level,
      "clases": @spell.clases.map { |clase| clase.nombre },
      "magic_school": @spell.magicschools.map { |ms| ms.nombre }[0],
      "desc": @spell.desc,
      "url": @spell.url,
    }
  end

  # POST /spells
  def create
    @spell = Spell.new(spell_params)

    if @spell.save
      render json: @spell, status: :created, location: @spell
    else
      render json: @spell.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /spells/1
  def update
    if @spell.update(spell_params)
      render json: @spell
    else
      render json: @spell.errors, status: :unprocessable_entity
    end
  end

  # DELETE /spells/1
  def destroy
    @spell.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spell
      @spell = Spell.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def spell_params
      params.permit(:name, :level, :desc, :clases)
    end
end
