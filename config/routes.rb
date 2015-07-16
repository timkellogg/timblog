Rails.application.routes.draw do
  
  root to: 'articles#index'

  devise_for :users
	
	resources :articles 

  match '/help',    to: 'static_pages#help',    via: 'get'  
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/resume',  to: 'static_pages#resume',  via: 'get'
end
