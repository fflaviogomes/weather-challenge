Rails.application.routes.draw do
  get 'dashboard/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'dashboard#index'

  get  '/api/forecast', to: 'dashboard#jsonAPI'
  post '/api/forecast', to: 'dashboard#jsonAPI'
end
