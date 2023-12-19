class WelcomeController < ApplicationController
  def index
    @user_signed_in = current_user.present?
  end
end
