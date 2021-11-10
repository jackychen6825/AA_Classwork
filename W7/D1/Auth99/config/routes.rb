Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'users/new'
  get 'users/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :cats, except: :destroy
  resources :cat_rental_requests, only: [:new, :create] do
    member do
      post :approve
      post :deny
    end
  end

  resources :users, only: [:new, :create] #creating the appropriate routes for user new and create -> new directs one to the form pg. create saves to db
  resource :session, only: [:new, :create, :destroy] 
  
  root to: redirect('/cats')
end
