Rails.application.routes.draw do
  resources :books
  devise_for :users ,:controllers => { :registrations => 'users/registrations' }
  get 'users/index'
  get 'users/show'
  #get 'users/show/#{current_user.id}'
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
