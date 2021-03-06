class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find_by_id(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new
    @article.title = params[:title]
    @article.description = params[:description]
    @article.save
    redirect_to article_path(@article)

    # @article = Article.create(title: params[:article][:title], description: params[:article][:description])
    # if @article.save
    #     redirect_to article_path(@article)
    # else
    #     render :new 
    # end
  end

  # add edit and update methods here
  def edit
    @article = Article.find_by_id(params[:id])
  end

  def update
    @article = Article.find_by_id(params[:id])
    # @article.update(title: params[:article][:title], description: params[:article][:description])
    
    @article.update(params.require(:article).permit(:title, :description))
    redirect_to article_path(@article)
  end


end
