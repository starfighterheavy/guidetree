require 'rapido'
class ObjectivesController < ApplicationController
  include Rapido::Controller
  include Rapido::AppController
  include Rapido::AppViews

  belongs_to :tree
  attr_permitted :parent_id, :title, :description
  authority :current_user

  private

  def after_create_path(*)
    tree_path(owner)
  end
  alias after_delete_path after_create_path
  alias after_update_path after_create_path
end
