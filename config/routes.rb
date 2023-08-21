Rails.application.routes.draw do


  namespace :admin do
    resources :users, only: [:index, :show, :edit]
  end

  namespace :admin do
    get '/' => 'homes#top'
  end

   devise_for :admin, skip: [:registraions, :passwords], controllers: {
    sessions: 'admin/sessions'
  }

  # 管理者側のルーティング、namespaceを使うことで、コントローラーがuserとかぶらないようにする

  scope module: :public do
    resource :users, only: [:show, :edit, :update]
    get 'users/confirm_delete', to: 'users#confirm_delete'
    patch 'users/unsubscribe', to: 'users#unsubscribe'
    
  end
  
  
  devise_for :users, skip: [:passwords], controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }

  devise_scope :user do
    post '/users/guest_sign_in', to: 'users/sessions#new_guest' #ゲストログインした際の処理
  end

  root to: 'homes#top'




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
