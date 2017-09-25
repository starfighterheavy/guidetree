class Objectives::CompletionsController < ApplicationController
  before_action :load_objective

  def new
    render "new"
  end

  def create
    @objective.assign_attributes(completion_params)
    @objective.save!
    redirect_to tree_path(@objective.tree)
  end

  private

  def completion_params
    params.require(:objective).permit(:completion_note).merge(completed_at: Time.now)
  end

  def load_objective
    @objective = current_user.objectives.find(params[:objective_id])
  end
end
