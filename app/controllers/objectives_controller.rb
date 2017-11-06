class ObjectivesController < ApplicationController
  include Rapido::Controller
  include Rapido::AppController
  include Rapido::AppViews

  belongs_to :tree
  authority :current_user
  attr_permitted :title, :description, :parent_id

  helper_method :objective
  helper_method :tree

  before_action :load_parent, only: [:new, :edit]

  private

  def load_parent
    return unless params[:parent_id]
    @parent = tree.objectives.find(params[:parent_id])
  end

  def after_create_path(*)
    tree_path(tree)
  end
  alias after_delete_path after_create_path
  alias after_update_path after_create_path

  def objective
    @resource || resource
  end

  def tree
    @owner || owner
  end
end
