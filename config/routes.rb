# frozen_string_literal: true

Rails.application.routes.draw do
  get 'nobel_prize/index'
  resources :weekly_sales
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {
    # Override the following Devise controllers with our custom versions
    sessions: "users/sessions"
  }

  # use devise_scope if you want custom routes to access devise controllers
  # here root path is accessing devise controller
  devise_scope :user do
    root to: "users/sessions#new"
  end

  resources :users, only: %i[show index edit update]
  resources :notifications
end
