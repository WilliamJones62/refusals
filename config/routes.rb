Rails.application.routes.draw do
  resources :drivers do
    collection { post :import }
  end
  devise_for :users, controllers: { registrations: "users/registrations" }
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
