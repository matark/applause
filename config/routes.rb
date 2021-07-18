Rails.application.routes.draw do
  resources :ping, only: [:index]
  resources :rate_limit, only: [:index]

  resources :sessions, only: [:create]
  resources :categories, only: [:index, :show], param: 'slug'

  resources :reports, except: [:destroy]
  resources :notifications, except: [:create]

  resources :posts do
    resources :post_hits, only: [:create]
    resources :reactions, shallow: true
    resources :comments, shallow: true do
      member do
        resources :likes, only: [:create, :destroy]
      end
    end
  end

  resources :teams, only: [:index, :show], param: 'slug' do
    member do
      delete :leave
      resources :members, param: 'username'
      resources :invitations, except: [:show]
    end
  end

  resources :users, only: [:index, :show], param: 'username' do
    member do
      scope module: 'follows' do
        resources :followers, only: [:index]
        resources :following, only: [:index, :show], param: 'x_username'
      end
    end
  end

  controller :user do
    get 'user', action: 'show'
    put 'user', action: 'update'
  end

  scope path: 'user' do
    resources :posts, only: [:index]
    resources :teams, only: [:index]
    resources :followers, only: [:index]
    resources :following, except: [:create], param: 'username'
  end

  namespace :search do
    resources :posts, only: [:index]
    resources :users, only: [:index]
  end
end
