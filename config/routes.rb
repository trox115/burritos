Rails.application.routes.draw do
  root 'burritos_info#index'
  get 'burritos_info/edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
