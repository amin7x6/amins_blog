Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :posts, only: [:show, :create, :new, :destroy] do
    resources :comments, only: [:create, :destroy]
  end


  resources :users, only: [:new, :create, :edit, :update]
  # get('/questions/new', { to: 'questions#new', as: 'new_question' })
  # post('/questions', { to: 'questions#create', as: 'questions' })
  resources :sessions, only: [:new, :create] do
            delete :destroy, on: :collection
  end

  root 'posts#index'


end
