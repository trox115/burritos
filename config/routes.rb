Rails.application.routes.draw do
  root 'burritos_info#index'
  get 'burritos_info/edit'
  post '/', to: 'burritos_info#create'
  post 'burritos_info/edit', to: 'burritos_info#patch'
  resources :burritos_info
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
