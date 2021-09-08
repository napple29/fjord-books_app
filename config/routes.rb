Rails.application.routes.draw do
  resources :books
  devise_for :users ,:controllers => { :registrations => 'users/registrations' }
  get 'users/index'
  get 'users/:id', to: 'users#show', as: 'users_show'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
