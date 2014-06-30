require 'uri'
module ApplicationHelper
  def self.base_url
    "http://api.yummly.com/v1/api/recipes?_app_id=08bc60b4&_app_key=ea1853f224bd17d6ee0b20e994147c9d&q="
  end

  def self.target_url(search_term)
    actual_term = search_term.gsub(" ", "+")
    URI.parse(URI.encode(ApplicationHelper.base_url + actual_term + "&requirePictures=true"))
  end
end


class YummlyAdapter
  def self.search(target)
    HTTParty.get(ApplicationHelper.target_url(target))
  end
end


class RecipesAdapter
  def self.serialize_input(terms)
    result = terms.downcase.gsub(" ", "+")
    result
  end

  def self.base_url(terms)
    URI.parse(URI.encode('http://example.com:3000/api/v1/aa02223a4295fa18b531/recipes/search/' + RecipesAdapter.serialize_input(terms)))
  end

  def self.search(terms)
    HTTParty.get(RecipesAdapter.base_url(terms))
  end
end