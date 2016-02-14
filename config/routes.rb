Influence::Application.routes.draw do

  devise_for :users

  resources :users do
    resources :brands
    resources :ambassadors
  end

  root :to => 'home#index'
end
