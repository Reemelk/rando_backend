class Api::V1::Characters::CharactersController < Api::V1::ApiController
  def show
    @characters = Character.select(:id, :pseudo, :server, :level).where(user_id: params[:user_id]).order('created_at DESC')

    render json: @characters, status: :accepted
  end

  def create
    @character = Character.new(character_params)

    if @character.save
      head :created
    else
      head :unprocessable_entity
    end
  end

  def update
  end

  def destroy
  end

  private

  def character_params
    params.require(:character).permit(:pseudo, :server, :category, :role, :level, :user_id)
  end
end
