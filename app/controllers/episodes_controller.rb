class EpisodesController < ApplicationController

  def index
    @episodes = Episode.all
  end

  def show
    @episode = Episode.find(params[:id])
    episode_id = @episode.id
    @appearances = Appearance.where(episode_id: episode_id)
    guest_ids = []
    @appearances.each do |appearance|
      guest_ids << appearance.guest_id
    end
    @guests = []
    guest_ids.each do |id|
      @guests << Guest.find(id)
    end

  end
end
