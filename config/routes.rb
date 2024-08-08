Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root 'entries#index'
  
  resources :entries, only: [:create, :new, :destroy, :update, :edit]

  post 'shift_date_left', to: 'entries#shift_date_left'
  post 'shift_date_right', to: 'entries#shift_date_right'


  # Defines the root path route ("/")
  # root "posts#index"
end
