Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'flights#index'
  resources :flights
  resources :bookings
  get '/bookings_search' => 'bookings#search', as: 'search_bookings'
end
