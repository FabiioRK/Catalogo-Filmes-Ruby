class HomeController < ApplicationController
  def index
  end

  def films
    @films = Film.all
  end

  def directors
    @directors = Director.all
  end

  def genres
    @genres = Genre.all
  end
end
