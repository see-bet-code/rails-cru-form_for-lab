class SongsController < ApplicationController

    def index
        @songs = Song.all
    end

    def show
        @song = select_song
    end

    def new
        @song = Song.new
    end

    def create
        @song = Song.create(require_params(:name, :artist_id, :genre_id))
        redirect_to song_path(@song)
    end

    def edit
        @song = select_song
    end

    def update
        @song = select_song
        @song.update(require_params(:name, :artist_id, :genre_id))
        redirect_to song_path(@song)
    end

    private

    def select_song
        Song.find(params[:id])
    end

    def require_params(*args)
        params.require(:song).permit(*args)
    end
end
