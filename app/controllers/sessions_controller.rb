class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in(user)
      redirect_to root_url
    else
      flash.now[:danger] = 'Email e Senha inválidos'
      render 'new'
    end
  end

  def show
  end

  def destroy
    sign_out
    flash[:warning] = 'Logout realizado com sucesso'
    redirect_to entrar_path
  end

end
