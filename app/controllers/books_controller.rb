class BooksController < ApplicationController
 def new
  @book = Book.new
  @authors = Author.all
  end

  def create
    @book = Book.new(book_params)
   if @book.save
     redirect_to @book, notice: "book was successfully created"
   else
    render "new"
   end
  end

  def index
    @books = Book.all
  end
   def show
     @book = Book.find(params[:id])
   end
   def edit
     @book = Book.find(params[:id])
     @authors = Author.all
   end

   def update
     @book = Book.find(params[:id])
     if @book.update(book_params)
       redirect_to @book, notice: "Books was successfully updated "
     else
      render "edit"
     end
   end

   def destroy
     @book = Book.find(params[:id])
     if @book.delete
       redirect_to books_path, notice: "Books was successfully created "
     else
      redirect_to books_path, notice: "Books was not created"
     end
   end

   private
  def book_params
    params.require(:book).permit(:name, :publication_date, :price, :author_id)
  end
end
