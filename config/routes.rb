Rails.application.routes.draw do
  namespace :users do
    get 'users/edit'
    get 'users/update'
    get 'users/show'
  end
  devise_for :admins
  devise_for :on_store_users
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
