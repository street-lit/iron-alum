Rails.application.routes.draw do
  resources :students
  resources :cohorts
  resources :locations

  get "/:city/:course_name", to: "locations#by_cohort"

  root "locations#index"

  match '*not_found_route', to: 'application#not_found', via: [:get, :post, :put, :delete]
end
