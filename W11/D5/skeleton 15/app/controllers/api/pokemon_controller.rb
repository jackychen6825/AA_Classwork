class Api::PokemonController < ApplicationController
    def index
        @pokemon = Pokemon.all 
        render :index
    end

    def show
        @pokemon = Pokemon.find(params[:id])
        @moves = @pokemon.moves
        @items = @pokemon.items
        render :show
    end
end
