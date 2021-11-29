Rails.application.routes.draw do
  get '/tickets', to: 'tickets#index'
  get 'tickets/:id', to: 'tickets#show'
  get '/', to: 'auth#show'
  post 'auth/login'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
