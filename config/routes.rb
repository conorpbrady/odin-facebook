Rails.application.routes.draw do
  devise_for :users
  get 'posts/new'
  get 'posts/create'
  get 'posts/index'
  get 'posts/destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'posts#index'
end
