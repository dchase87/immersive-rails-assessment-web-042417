class AppearancesController < ApplicationController

  def new
    @appearance = Appearance.new
  end

  def show
    @appearance = Appearance.find(params[:id])
  end

  def create #this can probably be refactored!
    appearance = Appearance.new(appearance_params)
    if Guest.find_by(name: params[:guest][:name]) != nil
      guest = Guest.find_by(name: params[:guest][:name])
      appearance.guest_id = guest.id
    else
      guest = Guest.create(name: params[:guest][:name], occupation: params[:guest][:occupation])
      appearance.guest_id = guest.id
    end
    if Episode.find_by(number: params[:episode][:number]) != nil
      episode = Episode.find_by(number: params[:episode][:number])
      appearance.episode_id = episode.id
    else
      episode = Episode.create(number: params[:episode][:number])
      appearance.episode_id = episode.id
    end
    appearance.save
    redirect_to episode_path(episode)
  end

  private

  def appearance_params
    params.require(:appearance).permit(:rating)
  end

end
