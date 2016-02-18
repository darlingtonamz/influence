Influence::Application.routes.draw do

  devise_for :users

  resources :users
  resources :brands do
    resources :campaigns
  end
  resources :ambassadors

  root :to => 'home#index'
end
