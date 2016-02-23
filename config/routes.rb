Influence::Application.routes.draw do
	devise_for :users
	resources :users
  resources :ambassadors
  get '/ambassadors/campaigns', to: 'ambassadors#campaigns'
  get '/instagram_redirect', to: 'ambassadors#instagram_redirect', as: :instagram_redirect

  resources :brands do
    resources :campaigns
  end

  root :to => 'home#index'
end
