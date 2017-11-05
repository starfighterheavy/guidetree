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

  def convert_to_trees
    @trees = resource_collection
  end

  def convert_to_node_tree
    @tree = NodeTree.new(resource)
  end
end
