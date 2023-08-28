Rails.application.routes.draw do

  namespace :admin do
    resources :users, only: [:index, :show, :edit]
    get '/' => 'homes#top'
  end

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }

  scope module: :public do
    resource :users, only: [:show, :edit, :update] do
      get 'confirm_delete'
      patch 'unsubscribe'
      get 'likes', on: :collection
      resource :follow, only: [:create, :destroy], module: :users
    end

    resources :posts, only: [:show, :edit, :update, :destroy, :new, :index, :create] do
      get 'search', on: :collection
      resources :comments, only: [:create]
      resources :likes, only: [:create, :destroy]
    end

  end

  devise_for :users, skip: [:passwords], controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }

  devise_scope :user do
    post '/users/guest_sign_in', to: 'users/sessions#new_guest' #ゲストログインした際の処理
  end

  root to: 'homes#top'
end

#