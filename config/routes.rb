Todo::Application.routes.draw do

  match "user/tomatoes" => "home#tomatoes"
  devise_for :users

  root :to => 'home#index'
  resources :tasks
  resources :timelets
  resources :tomatoes

  resources :goals do
    get 'tasks'
  end

end
