Rails.application.routes.draw do
	root 'users/users#home'

	devise_for :admins
  devise_for :on_store_users
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :users do
    resources :users ,only:[:show, :edit, :update] do
    	get '/about' => 'users#about', as: 'about'
  		resources :inquiries, only:[:new, :create] do
  			resources :replies, only:[:new, :create]
  		end
  		resources :orders, only:[:index, :show] do
  			resources :reviews, except:[:index, :show]
		 		resources :inquiries, only:[:new, :create] do
  				resources :replies, only:[:new, :create]
  			end
		  end
  	end
  	get '/shops/' => 'on_store_users#index', as: 'on_store_users_index'
  	get '/shops/:id' => 'on_store_users#show', as: 'on_store_users_show'
  end

  namespace :on_store_users do
    resources :on_store_users ,only:[:show, :edit, :update] do
    	get '/about' => 'users#about', as: 'about'
  		resources :inquiries, only:[:new, :create] do
  			resources :replies, only:[:new, :create]
  		end
  		resources :orders, only:[:index, :show] do
  			resources :reviews, except:[:index, :show]
		 		resources :inquiries, only:[:new, :create] do
  				resources :replies, only:[:new, :create]
  			end
		  end
  	end
  	get '/shops/' => 'on_store_users#index', as: 'on_store_users_index'
  	get '/shops/:id' => 'on_store_users#show', as: 'on_store_users_show'
  end
end
