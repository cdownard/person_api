Rails.application.routes.draw do
  root 'people#index'
  namespace :api do
    resources :people
  end
end
