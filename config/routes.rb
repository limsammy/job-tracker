Rails.application.routes.draw do

  resources :companies do
    resources :jobs
  end

  resources :jobs, only: [:index, :edit, :show, :update, :destroy]

  resources :categories
end
