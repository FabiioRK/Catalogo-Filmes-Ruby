class GenresController < ApplicationController
  def show
    @genre = Genre.find(params[:id])
    @films = @genre.films
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(name: params[:genre][:name])

    if @genre.save
      return redirect_to new_genre_path, notice: 'Gênero cadastrado com sucesso.'
    end

    flash.now.notice = 'Gênero não foi cadastrado.'
    render :new
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])

    if @genre.update(name: params[:genre][:name])
      return redirect_to genre_path(@genre.id), notice: 'Gênero atualizado com sucesso.'
    end

    flash.now.notice = 'Gênero não foi atualizado.'
    render :edit
  end
end
