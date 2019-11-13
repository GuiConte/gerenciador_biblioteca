class ReadersController < ApplicationController

  def  index
    @reader = Reader.all
  end

  def  show
    @reader = Reader.find(params[:id])
  end

  def new
    @reader = Reader.new
  end

  def create
    @reader = Reader.new(readers_params)
    if @reader.save
      flash[:success] = "Leitor cadastrado com sucesso !"
      redirect_to readers_path
    else
      render 'new'
    end
  end

  def  edit
    @reader = Reader.find(params[:id])
  end

  def  update
    @reader = Reader.find(params[:id])
    if @reader.update(readers_params)
      flash[:success] = "Leitor atualizado com sucesso !"
      redirect_to readers_path
    else
      render 'new'
    end
  end

  def  destroy
    @reader = Reader.find(params[:id])
    @reader.destroy
    redirect_to  readers_path
  end

  private
    def readers_params
      params.require(:reader).permit(:nome,:cpf,:endereco,:cidade,:uf,:email,:telefone)
    end

end
