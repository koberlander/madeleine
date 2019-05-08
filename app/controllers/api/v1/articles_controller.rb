require 'rest-client'

class Api::V1::ArticlesController < ApplicationController
  def index
    @articles = Article.all
    render json: @articles
  end

  def show
    @article = Article.find(params[:id])
    #render json: @article
  end

  def search
    search_term = params[:q]
    url =  'https://api.nytimes.com/svc/search/v2/articlesearch.json?q=' + search_term + '&api-key=' + ENV["SECRET_API_KEY"]
    response = RestClient.get(url)
    json = JSON.parse(response)
    format_json(json)

    # these lines are part of an incomplete solution to eliminate old searches
    @articles = format_json(json)
    render :index
    # redirect_to articles_path
  end

  def new
    @article = Article.new
  end

  private

  def article_params
    params.require(:article).permit(:web_url, :snippet, :headline, :author)
  end

  def format_json(json)
      all_articles = []
      json["response"]["docs"][0..10].each do |article_info|
          #byebug
          headline = article_info["headline"]["main"]
          author = article_info["byline"]["original"]
          pub_date = article_info["pub_date"].to_datetime
          snippet = article_info["snippet"]
          web_url = article_info["web_url"]
          article_object = {"headline": headline, "author": author, "pub_date": pub_date, "snippet": snippet, "web_url": web_url}
          article = Article.find_or_create_by(article_object)
          all_articles << article
          # we don't have memory objects for .methods (no readers or writers)
          # instead, we're accessing the key to that hash
          # we want an Array of AR Objects rather than hashes

      end
      # byebug
      return all_articles
  end

end
