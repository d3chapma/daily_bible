Rails.application.routes.draw do
  root to: 'session#new'

  post '/', to: 'session#create'
  get '/plans/:id/completed_readings', to: 'readings#update', as: :completed_readings
end
