class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale
  
  private

  # set the language
  def set_locale
      if user_signed_in?
        I18n.locale = current_user.language
      else
        if params[:locale].present?
          I18n.locale = params[:locale]
        end
      end
  end
  
  def default_url_options(options = {})
    {locale: I18n.locale}
  end
  
end
