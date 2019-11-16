class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'Usuario cadastrado com sucesso'
      redirect_to root_url
    else
      render 'new'
    end
  end

  def  edit
    @user = User.find(params[:id])
  end

  def  update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "Conta atualizada com sucesso ! Por favor, logue novamente."
      sign_out
      redirect_to entrar_path
    else
      render 'new'
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :name, :password, :password_confirmation)
    end

end
