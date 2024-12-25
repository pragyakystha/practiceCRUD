class AuthorsController < ApplicationController
  before_action :set_author, only: %i[show edit update destroy]

  def index
    @authors = Author.all
    @author = Author.new
  end

  def show
    @books = @author.books
  end

  def new
    @author = Author.new
  end

  def edit
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      redirect_to authors_path, notice: "Author was successfully created."
    else
      Rails.logger.error(@author.errors.full_messages)
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @author.update(author_params)
      redirect_to author_path(@author), notice: "Author was successfully updated."
    else
      Rails.logger.error(@author.errors.full_messages)
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @author.destroy
    respond_to do |format|
      format.html { redirect_to authors_path, status: :see_other, notice: "Author was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  private

  def set_author
    @author = Author.find(params[:id])
  end

  def author_params
    params.require(:author).permit(:name, :address, :phone_num)
  end
end
