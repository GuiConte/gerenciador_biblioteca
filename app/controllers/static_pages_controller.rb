class StaticPagesController < ApplicationController
  def index
    if !user_signed_in?
      redirect_to entrar_path
    end
  end

  def contato
  end

  def sobre
  end
end
