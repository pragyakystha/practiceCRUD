module Api
  module V1
    class ArticlesController < ApplicationController
      before_action :set_articles,  only: [ :show, :update, :destroy ]
      def index
        @articles = Article.all
        render json: @articles
      end

      def show
        @article = Article.find(params[:id])
        render json: @article
      end

      def create
        @article = Article.new(article_params)
        if @article.save
          render json: @article, status: :created
        else
          render json: @article.errors, status: :unprocessable_entity
        end
      end

      def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
          render json: { message: "Article updated successfully", article: @article }, status: :ok
        else
          render json: @article.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @article = Article.destroy
        if @article.destroy
          render json: { message: "Article deleted successfully", article: @article }, status: :no_content
        else
          render json: { error: "Unable to delete articles", article: @article },  status: :unprocessable_entity
        end
      end

      private

      def article_params
        params.require(:article).permit(:title, :content)
      end
    end
  end
end
