Rails.application.routes.draw do
  
  devise_for :admin, controllers: {
    sessions: 'admin/sessions',
  }

  namespace :admin do
    root to: "homes#top"
    resources :environments, only: [:index, :create, :edit, :update, :destroy]
    resources :prefectures, only: [:index, :create, :edit, :update, :destroy]
    resources :users, only: [:index, :show, :edit, :update]
    resources :post_comments, only: [:destroy]
  end

  devise_for :users, controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions',
  }
  
  scope module: :public do
    root to: "homes#top"
    get "how_to" => "homes#how_to"
    
    resources :users, only: [:show, :edit, :update] do
      collection do
        get 'confirm_withdraw'
        patch 'withdraw'
      end
    end
    
    resources :posts
    resources :post_comments, only: [:create, :destroy]
    resources :favorites, only: [:show, :create, :destroy]
    
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
