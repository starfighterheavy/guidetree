class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, unless: :devise_controller?

  private

  def set_flash_error(object)
    flash[:error] = object.errors.full_messages.join('.')
  end
end
