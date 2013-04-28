class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale
  
  # Devise: Where to redirect users once they have logged in
    def after_sign_in_path_for(resource)
     new_subscription_path # <- Path you want to redirect the user to.
    end
  
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
