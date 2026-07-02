require "open-uri"
require "json"

class GamesController < ApplicationController
  def new
    vowels = "aeiou".chars
    letters = ("a".."z").to_a - vowels
    @random_letters = letters.sample(5) + vowels.sample(5)
  end

  def score
    @original_letters = params[:original_letters].chars
    @url = "https://dictionary.lewagon.com/#{params[:word]}"
    dictionary_serialized = URI.parse(@url).read
    @dictionary = JSON.parse(dictionary_serialized = URI.parse(@url).read)
    @answer = params[:word].chars
    if (@answer - @original_letters).empty?
      if @dictionary["found"]
        @message = "Congrats! You won!"
      else
        @message = "#{params[:word]} doesn't exist, try another one!"
      end
    else
      @message = "You have not used the provided letters"
    end
  end
end
