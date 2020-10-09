class GenresController < ApplicationController
    def index
        @genres = Genre.all
    end

    def show
        @genre = select_genre
    end

    def new
        @genre = Genre.new
    end

    def create
        @genre = Genre.create(require_params(:name))
        redirect_to genre_path(@genre)
    end

    def edit
        @genre = select_genre
    end

    def update
        @genre = select_genre
        @genre.update(require_params(:name))
        redirect_to genre_path(@genre)
    end

    private

    def select_genre
        Genre.find(params[:id])
    end

    def require_params(*args)
        params.require(:genre).permit(*args)
    end
end
