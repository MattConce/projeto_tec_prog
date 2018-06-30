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

  def edit
    @user = current_user
    if @user.id != User.find(params[:id]).id
      redirect_to @user
    end 
  end

  def update
    @user = User.find(params[:id])
    @user.image = params[:image]
    printf("@user.image na função update %s\n", @user.image)

    printf(":user: %s\n", params[:user])

    uploader = ImageUploader.new
    if uploader.store!(params[:user][:imgage])
      printf("\n=)\n")
    end

    # file_path = "public/image/" << @user.id << "/" << @user.image.original_filename
    # printf("file_path: %s\n", file_path)
    # File.open(file_path) do |f|
    #   @user.image = f
    # end
    # @user.save

    printf("current_user.image na função update %s\n", current_user.image)
    if !@user.update_attributes(user_params)
      # redirect_to @user
      # render @user
    # else
      # render @user
    # else
      flash.now[:alert] = "Algo de errado aconteceu. Tente novamente."
      # render @user
    end
    redirect_to @user
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
