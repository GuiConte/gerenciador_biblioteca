class LoansController < ApplicationController

  def  index
    @loan = Loan.all
  end

  def new
    @loan = Loan.new
  end

  def devolucao
    @loan = Loan.find(params[:id])
    @loan.devolvido = true
    @book = Book.find(@loan.book_id)
    @book.quantidade = @book.quantidade + 1
    if @book.save && @loan.save
      flash[:success] = "Emprestimo devolvido com sucesso !"
      redirect_to loans_path
    end
    
  end

  def create
    @loan = Loan.new(loans_params)
    @book = Book.find(@loan.book_id)
    if @book.quantidade > 0 
      @book.quantidade = @book.quantidade - 1
      if @book.save
        if @loan.save
          flash[:success] = "Emprestimo cadastrado com sucesso !"
          redirect_to loans_path
        else
          render 'new'
        end
      end
    else
      flash[:danger] = "Emprestimo não realizado, nenhum exemplar deste livro está disponivel !"
      redirect_to loans_path
    end
  end

  def  edit
    @loan = Loan.find(params[:id])
  end

  def  update
    @loan = Loan.find(params[:id])
    if @loan.update(loans_params)
      flash[:success] = "Emprestimo atualizado com sucesso !"
      redirect_to loans_path
    else
      render 'new'
    end
  end

  def  destroy
    @loan = Loan.find(params[:id])
    @book = Book.find(@loan.book_id)
    @book.quantidade = @book.quantidade + 1
    if @book.save
      @loan.destroy
      redirect_to loans_path
    end
  end

  private
    def loans_params
      params.require(:loan).permit(:reader_id,:book_id,:data_emprestimo,:data_devolucao)
    end

end
