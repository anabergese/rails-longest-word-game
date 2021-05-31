require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = [*'A'..'Z'].sample(10)
  end

  def score
    @userInput = params[:longest]
    url = "https://wagon-dictionary.herokuapp.com/#{@userInput}"
    openU = URI.open(url).read
    userWord = JSON.parse(openU)

    @userInput.include?(@letters) && userWord["found"] == true

  end
end
