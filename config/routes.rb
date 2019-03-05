Rails.application.routes.draw do
  get 'tags/index'
  devise_for :users
  resources :posts do
    get :home, on: :collection
  end 

  root 'posts#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
