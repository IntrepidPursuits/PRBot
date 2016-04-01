Rails.application.routes.draw do
  resources :pull_requests, only: [:index, :create]
  resource :pull_requests, only: [:destroy]
  resources :ships, only: [:index,:create]
  resources :channel_web_hooks, only: [:create]
  resources :prbot, only: [:index]
end
