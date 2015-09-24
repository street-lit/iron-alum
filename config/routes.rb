Rails.application.routes.draw do
  resources :students
  resources :cohorts
  get '/bananas', to:'locations#index'
end
