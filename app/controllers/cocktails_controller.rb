class CocktailsController < ApplicationController
before_action :set_cocktail, only: [:show, :edit]

  def index
    @cocktails = Cocktail.all
  end

  def show
    @new_dose = Dose.new
    @ingredients = Ingredient.all
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktails_path
    else
      render :new
    end
  end


  private

  def cocktail_params
    params.require(:cocktail).permit(:name, photos: [])
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
