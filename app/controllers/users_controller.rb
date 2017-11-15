class UsersController < ApplicationController

  #GET /resources/:id
  def show
    @user = User.find(params[:id])
  end
end
