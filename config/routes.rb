Rails.application.routes.draw do
    resources :mainforums
    root 'mainforums#index'
end
