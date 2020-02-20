Rails.application.routes.draw do
  # devise_for :users
  get 'home' => 'home#index'
  # 以下の行を追加
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }
end
