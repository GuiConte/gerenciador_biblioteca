class BooksController < ApplicationController
  def  index
    if user_signed_in?
      @book = Book.all
    else
      flash[:danger] = "Faça Login para continuar"
      redirect_to entrar_path
    end
  end

  def  show
    @book = Book.find(params[:id]) 
  end

  def new
    if user_signed_in?
      @book = Book.new
    else
      flash[:danger] = "Faça Login para continuar"
      redirect_to entrar_path
    end
  end

  def create
    @book = Book.new(books_params)
    if @book.save
      flash[:success] = "Livro cadastrado com sucesso !"
      redirect_to books_path
    else
      render 'new'
    end
  end

  def  edit
    @book = Book.find(params[:id])
  end

  def  update
    @book = Book.find(params[:id])
    if @book.update(books_params)
      flash[:success] = "Livro atualizado com sucesso !"
      redirect_to books_path
    else
      render 'new'
    end
  end

  def  destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to  books_path
  end

  private
    def books_params
      params.require(:book).permit(:titulo,:autor,:descricao,:editora,:edicao,:quantidade)
    end

end
