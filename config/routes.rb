# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'tests#index'

  devise_for :users, controllers: { registrations: 'users/registrations' },
                     path: :gurus, path_names: { sign_in: :login, sign_out: :logout }

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

end
