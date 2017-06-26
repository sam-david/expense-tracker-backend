class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_controller?(names)
    names.include?(params[:controller]) unless params[:controller].blank? || false
  end

  helper_method :current_controller?
end
