class SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def new
      @user = User.new
    end
  
    def create
      @user = User.find_by(username: params[:user][:username])
      if @user && @user.authenticate(params[:user][:password])
        session['user_id'] = @user.id
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
