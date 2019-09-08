Rails.application.routes.draw do
	root 'users/users#home'

	devise_for :admins
  devise_for :on_store_users
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :users do
    resources :users ,only:[:show, :edit, :update] do
    	get '/about' => 'users#about', as: 'about'
  		resource :delivery_addresses, only:[:create, :update, :destroy]
  		resources :carts, only:[:create,:index,:update, :destroy]
      get '/orders/buy' => 'orders#new', as: 'orders_new'
  		resources :inquiries, only:[:new, :create]
  		resources :replies, only:[:new, :create]
  		resources :reviews, except:[:index, :show]
  	end
  	resources :on_store_users, only:[:index, :show] do
	 		resources :favorites, only:[:create, :destroy]
	  end
  end
end
