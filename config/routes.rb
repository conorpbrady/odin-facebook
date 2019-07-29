Rails.application.routes.draw do
  #get 'users/show'
  #get 'users/index'
  #get 'likes/create'
  #get 'likes/destroy'
  #get 'comments/create'
  #get 'comments/destroy'
  devise_for :users

  get 'posts/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'posts#index'
  resources :users,       only: [:show, :index]

  resources :posts,       only: [:index, :create, :destroy] do
    resources :comments,  only: [:create, :destroy]
    resources :likes,     only: [:create, :destroy]
  end
end
