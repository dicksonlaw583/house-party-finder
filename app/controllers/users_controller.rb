class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_fragment_user, only: [:profile, :activity, :subscribers, :portfolio, :subscribe, :unsubscribe]
  layout "user_fragment", only: [:profile, :activity, :subscribers, :portfolio]
  before_action :owner_only, only: [:edit, :update, :destroy]

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  # GET /users/1/profile
  def profile
  end

  # GET /users/1/activity
  def activity
    @attended_parties = @user.attended_parties.paginate(:page => params[:page], :per_page => 12)
  end

  # GET /users/1/subscribers
  def subscribers
    @subscribers = @user.subscribers.paginate(:page => params[:page], :per_page => 24)
  end

  # GET /users/1/portfolio
  def portfolio
    @hosted_parties = @user.hosted_parties.paginate(:page => params[:page], :per_page => 12)
  end

  # POST /users/1/subscribe
  def subscribe
    unless @user.subscribers.include?(current_user) || @user == current_user
      @user.subscribers << current_user
      @user.save
    end
    redirect_to :back
  end

  # POST /users/1/unsubscribe
  def unsubscribe
    if @user.subscribers.include?(current_user)
      @user.subscribers.delete(current_user)
      @user.save
    end
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
    def set_fragment_user
      @user = User.find(params[:user_id])
    end

    # Restrict to owner only
    def owner_only
      unless @user == current_user
        redirect_to root_url, notice: "You must be logged in as that user to make this change."
      end
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:username, :first_name, :last_name, :email, :join_date, :address, :city, :province, :latitude, :longitude, :avatar)
    end
end
