class SessionsController < ApplicationController
  def new
    @user = Token.new
  end

  def create
    username = params[:token][:user]
    password = params[:token][:password]
    user = Token.post(:active, :username=> username, :password => password)
    session[:token] = token(user)
    redirect_to whiteboard_show_url('21123', 'current')
  end

  def destroy
    @user = Token.new
    session[:token] = nil
    render "sessions/new"
  end

  def token(user)
    Token.new(user).guid
  end


end