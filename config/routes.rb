Rails.application.routes.draw do
    devise_for :users
    root 'mainforums#index'

    resources :mainforums do
        resources :topics, only: [:new, :create, :edit, :update, :destroy]
    end

    resources :topics, only: [:show] do
        resources :posts
    end


end
