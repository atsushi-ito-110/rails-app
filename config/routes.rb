Rails.application.routes.draw do
  get 'home' => 'home#index'
  root to: 'home#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  get 'users/more' => 'users#more'
  resources :users, only: %i[index show edit update]
  resources :tweets, only: %i[create index destroy]
  get 'tweets/more' => 'tweets#more'
  resources :follows, only: %i[create destroy]
  resources :searches, only: [:index]
end
