class ArticlesController < ApplicationController
    include ArticlesHelper

    def index
        @articles = Article.all
    end 

    def show
        @article =  Article.find(params[:id])
    end

    def new 
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)
        @article.save
        flash.notice = "Article '#{@article.title}' Created!"
        redirect_to article_path(@article)
    end
# if you are confused about what prefix and methods to use 
# simply run "rake routes" and see there 
    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        
        flash.notice = "Article '#{@article.title}' Destroyed!"
        
        redirect_to articles_path
    end

    def edit 
        @article = Article.find(params[:id])
    end
# note to self : i spent half an hour here because i thought that edit and update go in the same function 
# how incredibly dumb of me 
    def update
        @article = Article.find(params[:id])
        @article.update(article_params)

        flash.notice = "Article '#{@article.title}' Updated!"

        redirect_to article_path(@article)
    end
      
end
