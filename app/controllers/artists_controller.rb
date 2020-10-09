class ArtistsController < ApplicationController

    def index
        @artists = Artist.all
    end

    def show
        @artist = select_artist
    end

    def new
        @artist = Artist.new
    end

    def create
        @artist = Artist.create(require_params(:name, :bio))
        redirect_to artist_path(@artist)
    end

    def edit
        @artist = select_artist
    end

    def update
        @artist = select_artist
        @artist.update(require_params(:name, :bio))
        redirect_to artist_path(@artist)
    end

    private

    def select_artist
        Artist.find(params[:id])
    end

    def require_params(*args)
        params.require(:artist).permit(*args)
    end
end
