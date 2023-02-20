Rails.application.routes.draw do
  
  devise_for :admin, controllers: {
    sessions: 'admin/sessions',
  }

  namespace :admin do
    root to: "homes#top"
    resources :environments, except: [:new, :show]
    resources :prefectures, except: [:new, :show]
    resources :users, only: [:index, :show, :edit, :update]
    #不適切な投稿削除用
    resources :posts, only: [:show, :destroy] do
      #不適切なレビューやコメント削除用
      resources :post_comments, only: [:destroy]
    end
  end

  devise_for :users, controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions',
    passwords: 'puclic/passwords',
  }
  
  scope module: :public do
    root to: "homes#top"
    get "how_to" => "homes#how_to"
    
    devise_scope :user do
      #ゲストログイン用ルート
      post 'user/guest_sign_in' => 'sessions#guest_sign_in'
    end
    
    ##urlにidが含まれないようにuserはそれぞれurlを指定しています。
    #会員マイページ
    get 'users/mypage' => 'users#show', as: 'mypage'
    #users/editのようにするとdeviseのルーティングとかぶってしまうためinformationを付け加えています。
    get 'users/information/edit' => 'users#edit', as: 'edit_information'
    patch 'users/information' => 'users#update', as: 'update_information'
    put 'users/information' => 'users#update'
    #お気に入り一覧画面
    get 'users/favorites' => 'users#favorites', as: 'user_favorites'
    #会員退会確認画面
    get 'users/confirm_withdraw' => 'users#confirm_withdraw', as: 'confirm_withdraw'
    #退会アクション
    patch 'users/withdraw' => 'users#withdraw', as: 'withdraw_user'
    
    resources :posts do
      resources :post_comments, only: [:create, :destroy]
      resource :favorites, only: [:index, :create, :destroy]
    end
    
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
