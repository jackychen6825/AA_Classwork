Rails.application.routes.draw do
  get 'subs/index'
  get 'subs/new'
  get 'subs/show'
  get 'subs/create'
  get 'subs/destroy'
  get 'subs/edit'
  get 'subs/update'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  # get 'users/new'
  # get 'users/create'
  # get 'users/show'
  # get 'users/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show, :index]
end
