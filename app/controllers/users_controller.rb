class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index
    @users = User.order('created_at desc').limit(20)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /resources/:id
  def show
    @user = User.find(params[:id])
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])
    avatar = params[:user][:avatar]
    documents = params[:user][:documents]
    respond_to do |format|
      if @user.update_attributes(user_params)
        if avatar
          @user.avatar.attach(avatar)
        end
        if documents
          @user.documents.attach(documents)
        end
        format.html { redirect_to users_path, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:email)
  end

  def attachment_params
    params.require(:user).permit(:avatar, :documents)
  end

end
