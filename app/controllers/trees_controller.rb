require 'node_tree'
require 'rapido'

class TreesController < ApplicationController
  include Rapido::Controller
  include Rapido::AppController
  include Rapido::AppViews

  before_action :convert_to_node_tree, only: [:show]
  before_action :convert_to_trees, only: [:index]

  belongs_to_nothing!
  attr_permitted :name
  authority :current_user

  private

  def skip_authentication?
    @resource = Tree.find_by(public_uuid: params[:id])
    return true if @resource
    super
  end

  def convert_to_trees
    @trees = resource_collection
  end

  def convert_to_node_tree
    @tree = NodeTree.new(resource)
  end
end
