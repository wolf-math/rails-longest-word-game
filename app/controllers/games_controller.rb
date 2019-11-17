require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = (0...10).map { ('A'..'Z').to_a[rand(26)] }
  end

  def score
    @outcome = params[:outcome]
    @score = params[:score]
  end

  def score_post
    word = params[:word]
    letters = params[:letters].downcase.split('')
    if english_word?(word) && in_grid?(word, letters)
      @outcome = 'You Win!'
      @score = 100
    else
      @outcome = 'You have failed this game.'
      @score = 0
    end
    redirect_to score_path(score: @score, outcome: @outcome)
  end

  private

  def english_word?(word)
    response = open("https://wagon-dictionary.herokuapp.com/#{word}")
    json = JSON.parse(response.read)
    json['found']
  end

  def in_grid?(word, letters)
    word.chars.all? { |letter| word.count(letter) <= letters.count(letter) }
  end
end
