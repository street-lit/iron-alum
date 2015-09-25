Rails.application.routes.draw do
  resources :students
  resources :cohorts
  resources :locations

  match '*not_found_route', to: 'application#not_found', via: [:get, :post, :put, :delete]
end
