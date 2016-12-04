Rails.application.routes.draw do
    root 'mainforums#index'

    resources :mainforums do
        resources :topics
    end
end
