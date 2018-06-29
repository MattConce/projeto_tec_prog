class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]


  def new
     @user = User.new
  end
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.paginate(page: params[:page])
    @registers = @user.register
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

  # def edit
  #   @post = Post.find(params[:id])
  #   @user = current_user
  #   if @post.user.id  != @user.id
  #     redirect_to @user
  #   end 
  # end

  def update
    @user = User.find(params[:id])
    printf("Imagem na função update %s\n", @user.image)
    if @user.update_attributes(user_params)
      redirect_to post_path(@user)
    else
      render @user
    end
  end
  
  wrap_parameters :user, include: [:name, :age, :email, :password, :password_confirmation]



  private
    def user_params
      params.require(:user).permit(:name, :age, :email, :password, :password_confirmation, :image)
    end

    def correct_user
     @user = User.find(params[:id])
     redirect_to(root_url) unless current_user?(@user)
   end
end
