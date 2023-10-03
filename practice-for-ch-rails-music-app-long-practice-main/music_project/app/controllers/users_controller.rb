class UsersController < ApplicationController
    # before_action :require_logged_out, only: [:new, :create]
    # before_action :require_logged_in, only: [:show, :index]


    def index
        @users = User.all.order(:id)
        # render json: @users
        render :index
    end


    def show
        @user = User.find(params[:id])
        render :show
    end

    def new
        render :new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            login(@user)
            redirect_to user_url(@user)
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new, status: :unprocessable_entity
        end
    end

    private

    def user_params
        params.require(:user).permit(:email, :password)
    end
end