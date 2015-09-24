Rails.application.routes.draw do
  
  mount Ckeditor::Engine => '/ckeditor'
  root to: 'articles#index'
  get 'tags/:tag', to: 'articles#index', as: :tag

  devise_for :users
	
	resources :articles 

	match '/unpublished', to: 'articles#unpublished_articles', via: 'get'

  match '/about',  		  to: 'static_pages#about',            via: 'get'
  match '/resume', 		  to: 'static_pages#resume',           via: 'get'
end
