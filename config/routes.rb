Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'flights#index'
  resources :flights
  resources :bookings do
    collection do
      get 'search'
    end
  end
end
