Rails.application.routes.draw do
    resources :mainforums
    resources :topics
    root 'mainforums#index'
end
