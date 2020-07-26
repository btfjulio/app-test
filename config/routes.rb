Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'articles#index'

  resources :articles do
    resources :comments, only: %i[new create]
  end
  resources :comments, only: %i[edit update delete show]
end
