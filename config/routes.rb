Rails.application.routes.draw do
  get 'locations/find_address'
  get 'abouts/home'
  get 'tags/index'
  devise_for :users, controllers: {
    sessions: 'users/sessions', registrations: 'users/registrations', omniauth_callbacks: 'users/omniauth_callbacks'
  }

  get 'users/profile'

  resources :posts do
    get :home, on: :collection
    get :map, on: :collection
    resources :comments, only: :create
  end 

  resources :tags, only: [:index, :show]

  get 'abouts/home'
  root 'posts#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
