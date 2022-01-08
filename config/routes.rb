# frozen_string_literal: true

Rails.application.routes.draw do
  get :signup, to: 'users#new'
  get :login, to: 'sessions#new'
  get :exit, to: 'sessions#exit'

  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true, except: :index
    end
    post :start, on: :member
  end

  resources :results, only: %i[show update] do
    member do
      get :result
      post :start
    end
  end

  resources :users, only: :create

  resources :sessions, only: :create
end
