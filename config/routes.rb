Influence::Application.routes.draw do
	devise_for :users
	resources :users
  resources :ambassadors
  get '/ambassadors/campaigns', to: 'ambassadors#campaigns'
  get '/instagram_redirect', to: 'ambassadors#instagram_redirect', as: :instagram_redirect

  get '/users/sign_in?role=influencer', to: 'devise/sessions#new'
  get '/brand_list', to: 'brands#brand_list'
  resources :brands do

    resources :campaigns do
      get '/invite', to: 'campaigns#invite'
    end
  end

  root :to => 'home#index'
end
