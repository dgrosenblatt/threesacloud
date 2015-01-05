Rails.application.routes.draw do
  root 'weathers#index'
  devise_for :users
  resources :weathers do
    resources :reviews
  end

  resources :reviews, only: [] do
    resources :votes, only: [:create, :update, :destroy]
  end

  namespace :admin do
    resources :users, only: [:index]
  end
end
