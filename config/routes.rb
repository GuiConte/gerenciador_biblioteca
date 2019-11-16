Rails.application.routes.draw do

  root to: "static_pages#index"
  get 'sobre', to: 'static_pages#sobre'
  get 'contato', to: 'static_pages#contato'
  get 'devolucao', to: 'loans#devolucao'
  get 'entrar', to: 'sessions#new'
  post 'entrar', to: 'sessions#create'
  delete 'sair', to: 'sessions#destroy'

  resources :readers
  resources :users, only: [:new,:create,:edit,:update]
  resources :books
  resources :loans

end
