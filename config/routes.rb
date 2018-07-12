Rails.application.routes.draw do
  root to: 'session#new'

  resources :plans, except: [:index, :edit, :update]
end
