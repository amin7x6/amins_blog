class UsersController < ApplicationController

    def new
      @user = User.new
    end

    def create
      @user = User.new user_params
      session[:user_id] = @user.id
      if @user.save
        redirect_to root_path, notice: 'Thank you for signing up'
      end
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      if @user.update_attributes(user_params)
        redirect_to root_path, notice: 'Your profile just updated'
      else
        render 'edit'
      end
    end


  private

    def user_params
      params.require(:user).permit(:first_name,
                                   :last_name,
                                   :email,
                                   :password,
                                   :password_confirmation)
    end


end
