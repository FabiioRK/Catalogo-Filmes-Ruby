class DirectorsController < ApplicationController
  def show
    @director = Director.find(params[:id])
    @films = @director.films
  end

  def new
    @director = Director.new
  end

  def create
    director_params = params.require(:director).permit(:name, :nationality, :birth_date, :genre_id)
    @director = Director.new(director_params)

    if @director.save
      return redirect_to root_path, notice: 'Diretor(a) cadastrado com sucesso.'
    end

    flash.now.notice = 'Diretor(a) não foi cadastrado.'
    render :new
  end

  def edit
    @director = Director.find(params[:id])
  end

  def update
    @director = Director.find(params[:id])
    director_params = params.require(:director).permit(:name, :nationality, :birth_date, :genre_id)

    if @director.update(director_params)
      return redirect_to director_path(@director.id), notice: 'Diretor(a) atualizado com sucesso.'
    end

    flash.now.notice = 'Diretor(a) não foi atualizado.'
    render :edit
  end
end
