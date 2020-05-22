Rails.application.routes.draw do
  resources :topics, only: %i(index create show update) do
    resource :response, only: %i(create)
  end
  resources :categories, only: %i(index create show destroy)
  devise_for :users, skip: :all
  devise_scope :user do
    get 'sign_in', to: 'devise/sessions#new', as: 'new_user_session'
    post 'sign_in', to: 'devise/sessions#create', as: 'user_session'
    delete 'sign_out', to: 'devise/sessions#destroy', as: 'destroy_user_session'
    get 'sign_up', to: 'devise/registrations#new', as: 'new_user_registration'
    post 'sign_up', to: 'devise/registrations#create', as: 'user_registration'
  end
  root to: 'homes#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
