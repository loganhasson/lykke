class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate_user!

  def new_session_path(scope)
    new_user_session_path
  end

  protected

    def after_sign_in_path_for(resource)
      summaries_path
    end
end
