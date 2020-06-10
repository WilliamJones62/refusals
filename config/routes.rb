Rails.application.routes.draw do
  resources :drivers do
    collection { post :import }
  end
  devise_for :users, controllers: { registrations: "users/registrations" }
  get 'order_temps/list' => 'order_temps#list'
  get 'order_temps/selected' => 'order_temps#selected'
  get 'order_temps/search'
  get 'order_temps/find'
  resources :order_temps
  get 'returns/search'
  get 'returns/find'
  resources :returns
  get 'refusals/search'
  get 'refusals/find'
  resources :refusals
  get 'home/selected'
  root 'home#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
