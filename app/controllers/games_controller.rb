require 'open-uri'
require 'json'
require 'net/http'

class GamesController < ApplicationController
  def new
    @letters = Array.new(10){[*"A".."Z"].sample}
  end

  def score
    @letters = params["letters"].split("")
    @user_word = params["user-word"].upcase
    @word_in_grid = word_in_grid?(@user_word, @letters)
    @english_word = english_word?(@user_word)
  end

  private

  def word_in_grid?(word, grid)
    word.chars.all? { |letter| word.count(letter) <= grid.count(letter) }
  end

  def english_word?(word)
    url = "https://wagon-dictionary.herokuapp.com/#{word}"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    return JSON.parse(response)["found"]
  end
end
