Rails.application.routes.draw do
  resources :students
  resources :cohorts
  resources :locations

  # get "/welcome", to: "locations#by_cohort"

  match '*not_found_route', to: 'application#not_found', via: [:get, :post, :put, :delete]
end
