Influence::Application.routes.draw do
	devise_for :users
	resources :users
  resources :brands
  resources :ambassadors
  get '/ambassadors/campaigns', to: 'ambassadors#campaigns'

  root :to => 'home#index'
end
