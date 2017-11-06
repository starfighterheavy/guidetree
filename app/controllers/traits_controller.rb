class TraitsController < ApplicationController
  include Rapido::Controller
  include Rapido::AppController
  include Rapido::AppViews

  belongs_to_nothing!
  authority :current_user
  attr_permitted :title, :description
end
