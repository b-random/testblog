class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :show, :update, :destroy]

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(article_params)
    @article.user = User.first
    if @article.save
      flash[:success] = "Article successful"
      redirect_to article_path(@article)
    else
      render :new
    end
  end

  def show
    set_article
  end

  def edit
    set_article
  end

  def update
    set_article
    if @article.update(article_params)
      flash[:success] = "Successful update of article"
      redirect_to article_path(@article)
    else
      render :edit
    end
  end

  def destroy
    set_article
    @article.destroy
    flash[:notice] = "Successful destruction... Oxymoron?"
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :description)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
