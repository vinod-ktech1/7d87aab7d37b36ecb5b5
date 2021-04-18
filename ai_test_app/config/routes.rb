Rails.application.routes.draw do
  namespace :api do
    resources :users
  end

  namespace :api do
    get 'typeahead/:input', to: 'typehead#search'
  end
end
