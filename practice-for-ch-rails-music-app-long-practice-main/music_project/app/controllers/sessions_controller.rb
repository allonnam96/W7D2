class SessionsController < ApplicationController
    # before_action :require_logged_out, only: [:new, :create]
    # before_action :require_logged_in, only: [:destroy]
    
    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.find_by_credentials(params[:user][:username], params[:user][:username])

        if @user
            login(@user)
            redirect_to user_url(@user)
        else
            @user = User.new(username: params[:user][:username])
            flash.now[:errors] = ['Login Failed']
            render new, status: :unprocessable_entity
        end
    end

    def destroy
        logout!
        flash[:messages] = ['Logout Successful']
        redirect_to new_session_url
    end
end