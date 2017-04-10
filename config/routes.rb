Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts, only: [:show, :create, :new, :destroy] do
    resources :comments, only: [:create, :destroy]
  end

  root 'posts#index'


end
