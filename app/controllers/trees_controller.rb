require 'node_tree'

class TreesController < ApplicationController
  before_action :load_tree, except: [:new, :create, :index]

  def new
    @tree = Tree.new
    render "form"
  end

  def create
    tree = current_user.trees.new(tree_params)
    if tree.save
      redirect_to tree_path(tree.id)
    else
      flash[:error] = tree.errors.full_messages.join('.')
      redirect_to new_tree_path
    end
  end

  def index
    @trees = current_user.trees
  end

  def show
    @tree = NodeTree.new(@tree)
  end

  def edit
  end

  def update
    @tree.assign_attributes(tree_params)
    unless @tree.save
      flash[:error] = @tree.errors.full_messages.join('.')
    end
    redirect_to tree_path
  end

  def destroy
    @tree.destroy
    redirect_to trees_path
  end

  private

  def load_tree
    @tree = current_user.trees.find(params[:id])
  end

  def tree_params
    params.require(:tree).permit(:name)
  end
end
