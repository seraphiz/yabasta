Rails.application.routes.draw do
  get 'tags/index'
  devise_for :users
  get 'posts/index'

  root 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end