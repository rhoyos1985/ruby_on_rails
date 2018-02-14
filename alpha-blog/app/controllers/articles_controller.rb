class ArticlesController < ApplicationController
    
    def new
        @article = Article.new
    end

    def create
        @article = Article.new(article_params)
        if @article.save
          flash[:success] = "Object successfully created"
          redirect_to @article
        else
          flash[:error] = "Something went wrong"
          render 'new'
        end
    end

    def show
        @article = Article.find(params[:id])
    end
     
    private
        def article_params
            params.require(:article).permit(:title, :description)
        end
    

end