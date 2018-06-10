class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]


  def new
     @user = User.new
  end
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.paginate(page: params[:page])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Bem vindo ao Apoio Combate ao Câncer"
      redirect_to user_url(@user)
    else
      render 'new'
    end
  end

  def index
    @users = User.paginate(page: params[:page])
  end
  wrap_parameters :user, include: [:name, :age, :email, :password, :password_confirmation]

  private
    def user_params
      params.require(:user).permit(:name, :age, :email, :password, :password_confirmation)
    end

    def correct_user
     @user = User.find(params[:id])
     redirect_to(root_url) unless current_user?(@user)
   end
end
