Rails.application.routes.draw do
    devise_for :users
    root 'mainforums#index'

    resources :mainforums do
        resources :topics
    end
end
