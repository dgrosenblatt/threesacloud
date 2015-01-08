Rails.application.routes.draw do
  root 'weathers#welcome'
  devise_for :users
  resources :weathers do
    resources :reviews
  end

  resources :reviews, only: [] do
    resources :votes, only: [:create, :update, :destroy]
  end

  namespace :admin do
    resources :users, only: [:index, :destroy]
  end
end
