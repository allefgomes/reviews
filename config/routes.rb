Rails.application.routes.draw do
  resources :results, only: :show
  post 'opnion', to: 'opnions#create'
end
