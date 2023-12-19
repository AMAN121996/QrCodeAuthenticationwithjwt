# app/controllers/sessions_controller.rb
class SessionsController < ApplicationController
  def new
    if params[:token].present?
      @decoded = TokenService.decode(params[:token])
      user = User.find(@decoded['user_id'])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Login successful. Welcome!'
    end
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      token = TokenService.encode(user_id: user.id)
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Login successful. Welcome!'
    else
      render 'new', notice: 'Invalid email or password'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'Successfully signed out.'
  end

end
