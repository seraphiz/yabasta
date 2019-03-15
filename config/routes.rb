Rails.application.routes.draw do
  get 'locations/find_address', to: 'locations#find_address'
  get 'abouts/home'
  get 'tags/index', to: 'tags#index'
  devise_for :users, controllers: {
    sessions: 'users/sessions', 
    registrations: 'users/registrations', 
    omniauth_callbacks: 'users/omniauth_callbacks'
  }

resources :users, only: :index do
  get :aproved_posts, on: :collection
  get :posts_to_aprove, on: :collection
  get :moderator, on: :collection
  get :account, on: :collection
  patch :desactive, on: :member
  delete :destroy, on: :member
end 
  resources :posts do
    get :home, on: :collection
    get :map, on: :collection
    patch :moderator_aprove, on: :member
    resources :comments, only: [:create, :destroy]
    get :info, on: :member
  end 

  resources :tags, only: [:index, :show]
  root 'posts#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
