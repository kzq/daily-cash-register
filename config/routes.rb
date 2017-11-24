Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {
    # Override the following Devise controllers with our custom versions
    sessions: 'users/sessions'
  }

  devise_scope :user do
    root to: "users/sessions#new"
  end

  resources :users , :only => [:show]
  resources :notifications
end