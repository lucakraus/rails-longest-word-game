require 'json'
require 'open-uri'


class GamesController < ApplicationController

  def score
    @guess = params[:guess]
    @eng_word = english_word?(@guess)

  end

  def english_word?(word)
    url = "https://wagon-dictionary.herokuapp.com/#{word}"
    english_words = URI.open(url).read
    json = JSON.parse(english_words)
    return json['found']
  end

  def new
    list = ("a".."z").to_a
    @letters = []
    10.times { @letters << list.sample }
    @letters
  end
end
