require 'rest-client'

class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def search
    search_term = params[:q]
    url =  'https://api.nytimes.com/svc/search/v2/articlesearch.json?q=' + search_term + '&api-key=' + ENV["SECRET_API_KEY"]
    response = RestClient.get(url)
    json = JSON.parse(response)
    format_json(json)

    redirect_to articles_path
  end

  def new
    @article = Article.new
  end

  def edit

  end

  def update

  end

  private

  def article_params
    params.require(:article).permit(:web_url, :snippet, :headline, :author)
  end

  def format_json(json)
      all_articles = []
      json["response"]["docs"][0..10].each do |article_info|
          headline = article_info["headline"]["main"]
          author = article_info["byline"]["original"]
          snippet = article_info["snippet"]
          web_url = article_info["web_url"]
          article_object = {"snippet": snippet, "web_url": web_url, "headline": headline, "author": author}
          all_articles << article_object
          Article.find_or_create_by(article_object)

      end
      return all_articles
  end

end
