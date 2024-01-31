class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def new
      @user = User.new
    end
  
    def create
      @user = User.find_by(username: params[:user][:username])
      byebug
      if @user && @user.authenticate(params[:user][:password])
        byebug
        session['user_id'] = @user.id
        byebug
        render json: {
          token: get_token(payload(@user.username, @user.id)),
          user: UserSerializer.new(@user).serializable_hash[:data][:attributes]
        }
      else
        render json: {
          errors: "Wrong Credentials!"
        }, status: :unauthorized
      end
    end
  
    def destroy
      session.delete(:user_id)
    end
  
end
