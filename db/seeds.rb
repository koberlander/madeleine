
#


# times_article_search_api = `/https://api.nytimes.com/svc/search/v2/articlesearch.json?q=headline&api-key=#{api_key}`

Article.destroy_all
Keyword.destroy_all
ArticleKeyword.destroy_all

test1 = Article.create!(web_url: "fake.com", snippet: "it's fake",
author: "Fake Fakerson", headline: "Things are Fake, Says Faker")

tag_of_the_house_targaryen = Keyword.create!(name: "person", value: "First of Her Name")

tag2_of_the_house_targaryen = Keyword.create!(name: "person", value: "Second of Her Name")

tag3_of_the_house_targaryen = Keyword.create!(name: "person", value: "Third of Her Name")

shippy = ArticleKeyword.create!(article_id: test1.id, keyword_id: tag_of_the_house_targaryen.id)

shippy = ArticleKeyword.create!(article_id: test1.id, keyword_id: tag2_of_the_house_targaryen.id)

shippy = ArticleKeyword.create!(article_id: test1.id, keyword_id: tag3_of_the_house_targaryen.id)

def get_search_term
    search_term = gets.chomp
    return search_term
end

# adding search term
def get_nyt_json(search_term)
    url =  'https://api.nytimes.com/svc/search/v2/articlesearch.json?q=' + search_term + '&api-key=' + ENV["secret_api_key"]
    response = RestClient.get(url)
    json = JSON.parse(response)
    return json
end

def parse_json(json)
    all_articles = []
    json["items"][0..10].each do |article_info|
        snippet = article_info["docs"]["snippet"]
        url = article_info["docs"]["web_url"]
        all_articles << {"snippet": snippet, "url": web_url}
    end
    return all_articles
end

#
# def display_results(article_array)
#     # iterate over array of hashes and display title, author, snippet, and url
#     article_array.each do |book|
#
#     end
# end
#
# def main
#     search_word = ""
#     while search_word == ""
#         search_word = get_search_term
#     end
#     json = get_google_books_json(search_word)
#     if !json["items"].nil?
#         book_hash = parse_json(json)
#         display_results(book_hash)
#     else
#         puts "No results found"
#     end
# end
#
#
# parse_json(get_nyt_json('penguin'))

# main
