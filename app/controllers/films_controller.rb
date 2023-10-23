class FilmsController < ApplicationController
  def show
    @film = Film.find(params[:id])
  end

  def new
    @film = Film.new
  end

  def create
    film_params = params.require(:film).permit(:title, :release_year, :synopsis, :country, :duration,
                                               :director_id, :genre_id)
    @film = Film.new(film_params)

    if @film.save
      return redirect_to root_path, notice: 'Filme cadastrado com sucesso.'
    end

    flash.now.notice = 'Filme não foi cadastrado.'
    render :new
  end

  def edit
    @film = Film.find(params[:id])
  end

  def update
    @film = Film.find(params[:id])
    film_params = params.require(:film).permit(:title, :release_year, :synopsis, :country, :duration,
                                               :director_id, :genre_id)

    if @film.update(film_params)
      return redirect_to film_path(@film.id), notice: 'Filme atualizado com sucesso.'
    end

    flash.now.notice = 'Filme não foi atualizado.'
    render :edit
  end


end
