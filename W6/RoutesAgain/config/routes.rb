Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # get '/users', to: 'users#index'
  # get '/users/:id', to: 'users#show'
  # get '/users/new', to: 'users#new'
  # post '/users', to: 'users#create'
  # get '/users/:id/edit', to: 'users#edit'
  # patch '/users/:id', to: 'users#update' 
  # delete '/users/:id', to: 'users#destroy' 

  # get '/artworks', to: 'artworks#index'
  # get '/artworks/:id', to: 'artworks#show'
  # get '/artworks/new', to: 'artworks#new'
  # post '/artworks', to: 'artworks#create'
  # get '/artworks/:id/edit', to: 'artworks#edit'
  # patch '/artworks/:id', to: 'artworks#update' 
  # delete '/artworks/:id', to: 'artworks#destroy' 

  resources :artworks, except: [:index]

  resources :users do 
    resources :artworks, only: [:index]
  end 

  resources :artwork_shares, only: [:create, :destroy] 
  
  resources :comments, only: [:create, :destroy] 

  resources :artworks do 
    resources :comments, only: [:index]
  end 

  resources :users do 
    resources :comments, only: [:index]
  end 

end
