class Objectives::ObjectiveTraitsController < ApplicationController
  before_action :load_objective
  before_action :load_objective_trait, only: [:edit, :update, :destroy]

  def edit
  end

  def update
    @objective_trait.assign_attributes(objective_trait_params)
    if @objective_trait.save
      redirect_to objective_path(@objective)
    else
      set_flash_error(@objective_trait)
      redirect_to edit_objective_objective_trait_path(objective_id: @objective_trait.id, id: @objective.id)
    end
  end

  def destroy
    @objective_trait.destroy
    redirect_to objective_path(@objective)
  end

  def new
    @objective_trait = ObjectiveTrait.new
  end

  def create
    objective_trait = ObjectiveTrait.new(objective_trait_params)
    if objective_trait.save
      redirect_to objective_path(@objective)
    else
      set_flash_error(objective_trait)
      redirect_to new_objective_objective_trait_path(@objective)
    end
  end

  private

  def load_objective_trait
    @objective_trait = @objective.objective_traits.find(params[:id])
  end

  def objective_trait_params
    params.require(:objective_trait).permit(:trait_id, :amount).merge(objective_id: @objective.id)
  end

  def load_objective
    @objective = current_user.objectives.find(params[:objective_id])
  end
end
