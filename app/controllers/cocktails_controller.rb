class CocktailsController < ApplicationController
before_action :set_cocktail, only: [:show, :edit, :destroy]

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
      redirect_to cocktails_path, notice: 'successfully creating!'
    else
      render :new
    end
  end

  def destroy
    @cocktail = Cocktail.destroy(params[:id])
    redirect_to cocktails_path
  end


  private

  def cocktail_params
    params.require(:cocktail).permit(:name, photos: [])
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
