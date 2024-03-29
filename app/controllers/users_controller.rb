class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :requires_login, only: [:index, :show, :edit, :update, :destroy]
  before_action :set_user, only: [ :show, :edit, :update, :destroy ]
  
  # GET /users or /users.json
  def index
    @users = User.all
    render json: UserSerializer.new(@users).serializable_hash[:data].map { |hash| hash[:attributes] }
  end

  # GET /users/1 or /users/1.json
  def show
    if !authorized(@user)
      render json: { message: 'off limits' }, status: :unauthorized
    else
      render json: UserSerializer.new(@user).serializable_hash[:data][:attributes]
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    if @user.save
      render json: { message: 'User registered successfully' }, status: :created
    else
      render json: @user.errors.full_messages
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username, :first_name, :last_name, :email, :password)
    end

    def set_user
      @user = User.find(params[:id])
    end
end