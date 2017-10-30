Rails.application.routes.draw do
  root 'ideas#index'
  resources :ideas do
    resources :reviews, shallow: true, only: [:create, :edit, :destroy]
  end

  resources :users, only: [:new, :create]
  resource :session, only: [:new, :create, :destroy]
end
 
