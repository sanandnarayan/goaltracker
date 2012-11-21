Todo::Application.routes.draw do

  devise_for :users

  root :to => 'home#index'
  resources :tasks
  resources :goals do
    get 'tasks'
  end

end
