Rails.application.routes.draw do
  root 'opnions#index'
  post 'opnion', to: 'opnions#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
