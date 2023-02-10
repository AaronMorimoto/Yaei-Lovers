Rails.application.routes.draw do
  namespace :admin do
    get 'users/index'
    get 'users/show'
    get 'users/edit'
  end
  namespace :admin do
    get 'prefectures/index'
    get 'prefectures/edit'
  end
  namespace :admin do
    get 'environments/index'
    get 'environments/edit'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :public do
    get 'favorites/show'
  end
  namespace :public do
    get 'users/show'
    get 'users/edit'
    get 'users/confirm_withdraw'
  end
  namespace :public do
    get 'posts/index'
    get 'posts/show'
    get 'posts/new'
    get 'posts/edit'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/how_to'
  end
  devise_for :users
  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
