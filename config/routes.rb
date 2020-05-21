Rails.application.routes.draw do
  resources :topics, only: %i(index create show update) do
    resource :response, only: %i(create)
  end
  resources :categories, only: %i(index create show destroy)
  devise_for :users
  root to: 'homes#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
