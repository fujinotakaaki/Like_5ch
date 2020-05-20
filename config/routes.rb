Rails.application.routes.draw do
  resources :topics, %w(index create show update)
  resources :categories, %w(index create show update)
  devise_for :users
  root to: 'homes#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
