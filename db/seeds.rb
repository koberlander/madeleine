
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

# adding search term



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
