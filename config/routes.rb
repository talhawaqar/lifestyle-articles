Rails.application.routes.draw do
  get 'category/show'
  root 'home#index'
  get 'homme/index'
  devise_for :users
  resources :articles do
    member do
      post 'vote'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
