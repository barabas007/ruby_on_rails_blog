Rails.application.routes.draw do
  root 'posts#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :posts
  resources :pictures, only: [:create, :destroy]
  resources :tags, only:[:show] 
end
