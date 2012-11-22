Todo::Application.routes.draw do

  devise_for :users

  root :to => 'home#index'
  resources :tasks
  resources :timelets
  resources :tomatoes

  resources :goals do
    get 'tasks'
  end

end
