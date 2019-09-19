Rails.application.routes.draw do

	root 'users/users#home'

	devise_for :admins
  devise_for :on_store_users
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :users do
  	get '/about' => 'users#about', as: 'about'
  	get '/shops' => 'on_store_users#index', as: 'on_store_users_index'
  	get '/shops/:id'    => 'on_store_users#show', as: 'on_store_users_show'
    get '/shops/search' => 'on_store_users#search', as: 'search'
    resources :users ,only:[:show, :edit, :update] do
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
  	end
  end

  namespace :on_store_users do
  	get '', to:'on_store_users#home'
  	get '/form' => 'on_store_users#form', as: 'form'
    post '/form/ok' => 'on_store_users#form', as: 'form_ok'
    resources :on_store_users ,only:[:show, :edit, :update] do
    	# get '/sales' => 'on_store_users#sales', as: 'sales'
      get '/withdrawal' => 'on_store_users#withdrawal', as: 'withdrawal'
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

  namespace :admins do
    get '', to:'admins#home'
    resources :orders, only:[:index, :show]
    resources :users, only:[:index, :show]
    resources :on_store_users, only:[:index, :show]
    resources :inquiries, only:[:index, :show]
    resources :reviews, only:[:index, :show]
  end

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end
end
