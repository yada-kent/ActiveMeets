Rails.application.routes.draw do

  get 'tags/index'
  get 'public/user_deleted'

  namespace :admin do
    root to: "homes#top"
  resources :users, only: [:index, :show, :edit, :update] do
    member do
      patch :unsubscribe
      patch :rejoin
    end
  end
  resources :posts, only: [:destroy, :show, :edit, :update]
  resources :comments, only: [:destroy]
end

namespace :admin_namespace do
  resources :tags, only: [:index, :destroy]
end

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }



  scope module: :public do
    resource :users, only: [:show, :edit, :update] do
      get 'confirm_delete'
      patch 'unsubscribe'
      get 'likes', on: :collection
      resource :follow, only: [:create, :destroy]
    end

    get 'users/:id/followees', to: 'users#followees', as: 'user_followees'
    get 'users/:id/followers', to: 'users#followers', as: 'user_followers'

    resources :posts, only: [:show, :edit, :update, :destroy, :new, :index, :create] do
      get 'search', on: :collection
      resources :comments, only: [:create]
      resources :likes, only: [:create, :destroy]
    end

    resources :comments, only: [:edit, :update, :destroy]

  end

  get 'users/:id/profile', to: 'public/users#profile', as: 'user_profile'

  devise_for :users, skip: [:passwords], controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }

  devise_scope :user do
    post '/users/guest_sign_in', to: 'users/sessions#new_guest' #ゲストログインした際の処理
  end

  resources :tags, only: [:index, :create]

  get 'tags/:tag', to: 'public/posts#tagged', as: :tag

  get 'user_deleted', to: 'public#user_deleted', as: 'user_deleted'



  root to: 'homes#top'
end

