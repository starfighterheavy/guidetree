class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, unless: :skip_authentication?

  private

  def skip_authentication?
    devise_controller?
  end

  def set_flash_error(object)
    flash[:error] = object.errors.full_messages.join('.')
  end
end
