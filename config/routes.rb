Rails.application.routes.draw do
  resources :companies do
    resources :jobs
  end

  resources :jobs, only: [:index, :edit, :show, :update, :destroy]

  resources :jobs, only: [:show] do
    resources :comments, only: [:create]
  end

  resources :categories

  resources :companies, only: [:show] do
    resources :contacts, only: [:create]
  end

  get '/dashboard' => 'dashboard#dashboard'

  root to: 'dashboard#dashboard'
end
