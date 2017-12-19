class Api::V1::Characters::CharactersController < Api::V1::ApiController
  before_action :find_character, only: [:update, :destroy]

  def show
    @characters = Character.select(:id, :pseudo, :server, :category, :level).where(user_id: params[:user_id]).order('created_at DESC')
    render json: @characters, status: :accepted
  end

  def create
    @character = Character.new(character_params)
    if @character.save
      render json: @character, status: :created
    else
      head :unprocessable_entity
    end
  end

  def update
    if @character.update_attributes(character_params)
      render json: @character, status: :ok
    else
      head :unprocessable_entity
    end
  end

  def destroy
    @character.destroy
    head :ok
  end

  private

  def find_character
    @character = Character.find(params[:id])
  end

  def character_params
    params.require(:character).permit(:pseudo, :server, :category, :role, :level, :user_id)
  end
end
