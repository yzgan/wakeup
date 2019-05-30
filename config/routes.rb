Rails.application.routes.draw do
  resources :beaters
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'beaters#index'
end
