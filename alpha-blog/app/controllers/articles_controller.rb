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
    
    def destroy
        @article = Article.find(params[:id])
        @article.destroy ? flash[:success] = 'Object was successfully deleted.' : flash[:error] = 'Something went wrong'
        redirect_to articles_path
    end
    

    def edit
        @article = Article.find(params[:id])
    end
    
    def index
        @articles = Article.all
    end
    

    def show
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])
        if @article.update_attributes(article_params)
          flash[:success] = "Article was successfully updated"
          redirect_to @article
        else
          flash[:error] = "Something went wrong"
          render 'edit'
        end
    end
    

    private
        def article_params
            params.require(:article).permit(:title, :description)
        end
    

end