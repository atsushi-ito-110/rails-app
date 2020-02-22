Rails.application.routes.draw do
  get 'home' => 'home#index'
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }
  resources :users, only: [:index, :show, :edit, :update] # 追加
end
