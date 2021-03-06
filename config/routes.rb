# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'tests#index'

  devise_for :users, controllers: { registrations: 'users/registrations' },
                     path: :gurus, path_names: { sign_in: :login, sign_out: :logout }

  resources :tests, only: :index do
    post :start, on: :member
  end

  resources :badges, only: :index do
    get :achievements, on: :collection
  end

  resources :results, only: %i[show update] do
    member do
      get :result
      post :start
    end
  end

  resource :gists, only: :create

  namespace :admin do
    resources :gists, only: :index
    resources :badges
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
  end
end
