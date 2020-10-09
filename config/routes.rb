Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'flights#index'
  resource :flights

  get 'flights' => 'flights#index'
end
