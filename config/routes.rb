Rails.application.routes.draw do
  get 'home' => 'home#index'
  root :to => 'home#index'
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }
  resources :users, only: [:index, :show, :edit, :update]
  resources :tweets, only: [:create, :index, :destroy]
  get 'tweets/index_part' => 'tweets#index_part'
  resources :follows, only: [:create, :destroy]
end
