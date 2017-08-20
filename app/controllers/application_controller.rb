class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def set_flash_error(object)
    flash[:error] = object.errors.full_messages.join('.')
  end
end
