Rails.application.routes.draw do

  root 'posts#index'

  devise_for :users

  resources :users, only: [:index, :show]
  resources :posts, only: [:index, :create] do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]
  end
  post '/users/add_friend', to: 'users#add_friend', as: 'add_friend'
  post '/users/accept_friendship', to: 'users#accept_friendship', as: 'accept_friendship'
  post '/users/refuse_friendship', to: 'users#refuse_friendship', as: 'refuse_friendship'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
