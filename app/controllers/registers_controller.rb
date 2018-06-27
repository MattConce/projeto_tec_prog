class RegistersController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  def new
    @register = current_user.build_register()
    @user = current_user
  end

  def create
    @register = current_user.build_register(register_params)
    @user = current_user
    if @register.save
      flash[:success] = "Cadastro criado"
      UserMailer.with(user: @user).info_email(@user).deliver
      redirect_to root_url
    else
      render 'new'
    end
  end

  private

    def register_params
      params.require(:register).permit(:blood_type, :cancer_type, :local, :blood_donation, :bone_donation)
    end
end
