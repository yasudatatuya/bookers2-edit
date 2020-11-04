Rails.application.routes.draw do
  devise_for :users
  get 'home/about'
  root to:'home#top'
  resources :users, only: [:show, :index, :edit, :update] do
    member do
      get :following, :followers
      end
    end
  resources :relationships, only: [:create, :destroy]
  resources :books do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end