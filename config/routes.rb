Rails.application.routes.draw do

	root 'users/users#home'

	devise_for :admins
  devise_for :on_store_users
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :users do
  	get '/about' => 'users#about', as: 'about'
  	get '/shops' => 'on_store_users#index', as: 'on_store_users_index'
  	get '/shops/:id' => 'on_store_users#show', as: 'on_store_users_show'
    resources :users ,only:[:show, :edit, :update] do
      get '/withdrawal' => 'users#withdrawal', as: 'withdrawal'
  		resources :inquiries, only:[:new, :create, :index, :show] do
  			resources :replies, only:[:new, :create]
  		end
  		resources :orders, except:[:destroy] do
  			resources :reviews, except:[:index]
        get '/inquiries' => 'order#inquiry', as: 'inquiries'
		 		resources :inquiries, only:[:new, :create] do
  				resources :replies, only:[:new, :create, :show]
  			end
		  end
  	end
  end

  namespace :on_store_users do
  	get '', to:'on_store_users#home'
  	get '/form' => 'on_store_users#form', as: 'form'
    resources :on_store_users ,only:[:show, :edit, :update] do
    	get '/sales' => 'on_store_users#sales', as: 'sales'
      get '/withdrawal' => 'on_store_users#withdrawal', as: 'withdrawal'
    	resources :reviews, only:[:index, :destroy]
    	resources :inquiries, only:[:index, :show] do
  			resources :replies, only:[:new, :create]
  		end
  		resources :orders, except:[:create, :destroy] do
		 		resources :inquiries, only:[:new, :create] do
  				resources :replies, only:[:new, :create]
  			end
		  end
  	end
  end

  namespace :admins do
    get '', to:'admins#home'
    resources :orders, only:[:index, :show]
    resources :users, only:[:index, :show]
    resources :on_store_users, only:[:index, :show]
    resources :inquiries, only:[:index, :show]
    resources :reviews, only:[:index, :show]
  end
end
