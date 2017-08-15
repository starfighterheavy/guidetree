class ObjectivesController < ApplicationController
  before_action :load_objective, except: [:new, :create]

  def new
    @objective = Objective.new
    render "form"
  end

  def create
    @objective = Objective.new(objective_params)
    unless @objective.save
      flash[:error] = @objective.errors.full_messages.join(".")
    end
    redirect_to tree_path
  end

  def show
  end

  def edit
    render "form"
  end

  def update
    @objective.assign_attributes(objective_params)
    unless @objective.save
      flash[:error] = @objective.errors.full_messages.join(".")
    end
    redirect_to tree_path
  end

  def destroy
    unless @objective.destroy
      flash[:error] = @objective.errors.full_messages.join(".")
    end
    redirect_to tree_path
  end

  private

  def objective_params
    params.require(:objective).permit(:parent_id, :title)
  end

  def load_objective
    @objective = Objective.find(params[:id])
  end
end
