class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def index
  end

  def test
    # whatever the hell i want
    Plant.all.sample.notify
    render text: 'Check your phone, dood.'
  end

  def current_user
    User.find_by(id: session[:current_user])
  end

  def authenticate
    redirect_to sessions_new_path unless current_user
  end
end
