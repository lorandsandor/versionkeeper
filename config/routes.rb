Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'callbacks' }

  root 'projects#index'

  resources 'projects'
  resources 'releases'
end
