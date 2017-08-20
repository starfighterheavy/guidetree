class TraitsController < ApplicationController
  before_action :load_trait, except: [:index, :new, :create]

  def new
    @trait = Trait.new
    render "form"
  end

  def create
    trait = Trait.new(trait_params)
    if trait.save
      redirect_to traits_path
    else
      set_flash_error(trait)
      redirect_to new_trait_path
    end
  end

  def index
    @traits = Trait.all
  end

  def edit
    render "form"
  end

  def update
    @trait.assign_attributes(trait_params)
    if @trait.save
      redirect_to trait_path(@trait)
    else
      set_flash_error(@trait)
      redirect_to edit_trait_path(@trait)
    end
  end

  def destroy
    @trait.destroy
    redirect_to traits_path
  end

  private

  def trait_params
    params.require(:trait).permit(:title, :description)
  end

  def load_trait
    @trait = Trait.find(params[:id])
  end
end
