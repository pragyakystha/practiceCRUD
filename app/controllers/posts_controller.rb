class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      respond_to do |format|
      format.html { redirect_to posts_path, notice: "Post was successfully created." }
      format.js
      end
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      respond_to do |format|
        format.html { redirect_to @post, notice: "Post was successfully updated." }
        format.js
      end
    else
      respond_to do |format|
        format.html { render :edit }
        format.js
      end
    end
  end


  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.js
    end
  end

   private

   def set_post
     @post = Post.find(params[:id])
   end

  def post_params
  params.require(:post).permit(:title, :body)
  end
end
