Rails.application.routes.draw do
  root to: "home#index"
  get('/films', to: 'home#films')
  get('/directors', to: 'home#directors')
  get('/genres', to: 'home#genres')

  resources :films, only: [:show, :new, :create, :edit, :update]
  resources :genres, only: [:show, :new, :create, :edit, :update]
  resources :directors, only: [:show, :new, :create, :edit, :update]
end
