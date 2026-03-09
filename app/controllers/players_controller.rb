class PlayersController < ApplicationController
  def index
    @players = Player.order(:name)
  end

  def show
    @player = Player.find(params[:id])
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)

    if @player.save
      redirect_to players_path, notice: "Player was successfully added."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @player = Player.find(params[:id])
    @player.destroy
    redirect_to players_path, notice: "Player was successfully removed."
  end

  private

  def player_params
    params.require(:player).permit(:name, :gender, :email, :phone, :address, :city, :state, :zip)
  end
end
