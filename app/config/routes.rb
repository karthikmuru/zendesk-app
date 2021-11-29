Rails.application.routes.draw do
  get '/tickets', to: 'tickets#index'
  get 'tickets/:id', to: 'tickets#show'
  get '/', to: 'auth#show'
  post 'auth/login'
end
