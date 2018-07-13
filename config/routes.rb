Rails.application.routes.draw do
  root to: 'plans#new'

  resources :plans, except: [:index, :edit, :update] do
    get 'email', on: :member
  end

  resources :readings, only: [] do
    get 'complete', on: :member
  end
end
