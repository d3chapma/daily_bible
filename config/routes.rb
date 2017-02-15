Rails.application.routes.draw do
  root to: 'session#new'

  post '/', to: 'session#create'
end
