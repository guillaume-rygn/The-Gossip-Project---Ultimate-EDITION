Rails.application.routes.draw do

  resources :gossips do
    resources :comments
    resources :likes, only:[:new, :create, :destroy]
  end
  resources :users, only:[:show, :new, :create]
  resources :cities, only:[:show]

  resources :sessions, only:[:new, :create, :destroy]


  #mise en place du root principal
  root to:'gossips#index' 

  #mise en place d'une page team depuis le controller pages
  get '/team', to: 'pages#team', as: 'team' #création d'un nom pour le chemin

  #mise en place d'une page contact depuis le controller pages
  get '/contact', to: 'pages#contact', as: 'contact' #création d'un nom pour le chemin

  #mise en place d'une route dynamique
  get 'welcome(/:first_name)', to: 'pages#welcome', as: 'welcome' #création d'un nom pour le chemin
  #mise en place d'un parametre optionnel pour first_name

  #mise en place d'un route dynamique
  #get 'potin/:id', to:'pages#potin', as: 'potin'

  #mise en place d'un route dynamique
  #get 'potin/auteur/:title', to:'pages#auteur', as: 'auteur'

end
