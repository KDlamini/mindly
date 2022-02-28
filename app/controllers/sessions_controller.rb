class SessionsController < ApplicationController
  def new; end

  def destroy
    session.clear
    redirect_to user_session_path
  end
end
