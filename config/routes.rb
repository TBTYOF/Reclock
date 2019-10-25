Rails.application.routes.draw do

  namespace :users do
    get 'card/new'
    get 'card/show'
  end
	root 'users/users#home'

	devise_for :admins
  devise_for :on_store_users, controllers: {
    sessions:      'on_store_users/sessions',
    #passwords:     'users/passwords',
    #registrations: 'users/registrations'
  }
  devise_for :users, controllers: {
    sessions:      'users/sessions',
    #passwords:     'users/passwords',
    #registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :users do
    devise_scope :user do
      get '/logout', to: 'sessions#destroy', as: 'logout'
    end
  end

  namespace :users do
  	get '/about' => 'users#about', as: 'about'
  	get '/shops' => 'on_store_users#index', as: 'on_store_users_index'
  	get '/shops/:id'    => 'on_store_users#show', as: 'on_store_users_show'
    get '/shops/search' => 'on_store_users#search', as: 'search'
    resources :users ,only:[:show, :edit, :update, :destroy] do
      get '/withdrawal' => 'users#withdrawal', as: 'withdrawal'
      get '/shops/:shop_id/inquiry/new' => 'inquiries#new', as: 'inquiry_new'
      post '/shops/:shop_id/inquiry' => 'inquiries#create', as: 'inquiry_create'
      get '/shops/:shop_id/inquiries' => 'inquiries#inquiry', as: 'inquiries_key'
  		resources :inquiries, only:[:index, :show] do
  			resources :replies, only:[:new, :create]
  		end
  		resources :orders, except:[:destroy] do
  			resources :reviews, except:[:index]
		 		resources :inquiries, only:[] do
  				resources :replies, only:[:new, :create, :show]
  			end
		  end
      resources :card, only: [:new, :show] do
        collection do
          post 'show', to: 'card#show'
          post 'pay', to: 'card#pay'
          post 'delete', to: 'card#delete'
        end
      end
  	end
  end

  namespace :on_store_users do
  	get '/form' => 'on_store_users#form', as: 'form'
    post '/form/ok' => 'on_store_users#form', as: 'form_ok'
    resources :on_store_users ,only:[:show, :edit, :update, :destroy] do
    	# get '/sales' => 'on_store_users#sales', as: 'sales'
      get '/home' => 'on_store_users#home', as: 'home'
      get '/withdrawal' => 'on_store_users#withdrawal', as: 'withdrawal'
      resources :on_store_user_images ,only:[:edit, :destroy]
    	resources :reviews, only:[:index, :destroy]
    	resources :inquiries, only:[:index, :show] do
  			resources :replies, only:[:new, :create]
  		end
  		resources :orders, except:[:create] do
        resources :order_images, only:[:destroy]
		 		resources :inquiries, except:[:destroy, :edit, :update] do
  				resources :replies, only:[:new, :create, :show]
  			end
		  end
  	end
  end

  namespace :on_store_users do
    devise_scope :on_store_user do
      get '/logout', to: 'sessions#destroy', as: 'logout'
    end
  end

  namespace :admins do
    get '', to:'admins#home'
    resources :orders, only:[:index, :show]
    resources :users, except:[:edit]
    resources :on_store_users, except:[:edit]
    resources :inquiries, only:[:index, :show]
    resources :reviews, only:[:index, :show, :destroy]
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
