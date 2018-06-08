class UsersController < ApplicationController
  def new
     @user = User.new
  end
  def show
    @user = User.find(params[:id])
    #debugger
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

  private
    def user_params
      params.require(:user).permit(:name, :age, :email, :password, :password_confirmation)
    end
end
