class ObjectivesController < ApplicationController
  before_action :load_objective, except: [:new, :create]
  before_action :load_tree, only: [:create, :new]

  def new
    @objective = Objective.new
    @parent = Objective.find(params[:parent_id]) if params[:parent_id]
    render "form"
  end

  def create
    @objective = @tree.objectives.new(objective_params)
    unless @objective.save
      flash[:error] = @objective.errors.full_messages.join(".")
    end
    redirect_to tree_path(@objective.tree.id)
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
    redirect_to tree_path(@objective.tree.id)
  end

  def destroy
    unless @objective.destroy
      flash[:error] = @objective.errors.full_messages.join(".")
    end
    redirect_to tree_path(@objective.tree.id)
  end

  private

  def objective_params
    params.require(:objective).permit(:parent_id, :title, :description)
  end

  def load_objective
    @objective = Objective.find(params[:id])
  end

  def load_tree
    @tree = Tree.find(params[:tree_id])
  end
end
