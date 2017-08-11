class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Setting language
  before_action :set_locale


  private

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
    # current_user.try(:locale) || 
  end

  def default_url_options
    { locale: I18n.locale }
  end

end
