class ArticlesController < ApplicationController
  before_filter :authenticate, :only => [:create, :destroy]

  def create
    @article = utilisateur_courant.articles.build(article_params)
    if @article.save
      flash[:success] = "Article créé"
      redirect_to root_url
    else
      redirect_to root_url
    end
  end

  def destroy

  end

  private

  def article_params
    params.require(:article).permit(:titre, :description)
  end

end
