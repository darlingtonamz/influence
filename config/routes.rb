Influence::Application.routes.draw do

  devise_for :users

  resources :users
    resources :brands
    resources :ambassadors

  root :to => 'home#index'
end
