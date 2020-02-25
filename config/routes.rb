Rails.application.routes.draw do
  get 'home' => 'home#index'
  root :to => 'home#index'
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }
  resources :users, only: [:index, :show, :edit, :update]
  resources :tweets, only: [:create] # 追加
end
