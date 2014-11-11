Rails.application.routes.draw do
  resources :companies
  root 'charges#index'

  resources :charges, :only => [:index, :new, :create]
  get '/charges/:unique_code' => 'charges#show'

  resources :users

end
