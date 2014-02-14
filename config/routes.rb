AuraxisGoverned::Application.routes.draw do
  resources :characters

  resources :troopers

  resources :missions

  get "test/index"

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  devise_scope :user do
    get 'sign_out', :to => 'devise/sessions#destroy', as: :destroy_user_session
  end

  root 'welcome#index'
end
