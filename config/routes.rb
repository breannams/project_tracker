Rails.application.routes.draw do
  root 'sessions#home'
  
  get '/projects/collaboration', to: 'projects#collaboration'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/auth/google_oauth2/callback' => 'sessions#omniauth'

  get '/projects/all', to: 'projects#all'
  
  resources :entries do
    member do
      delete :delete_file
    end
  end
  
  resources :projects, except: [:index] do
    resources :entries
  end
  
  resources :users do 
    resources :projects, only: [:index]
  end

  resources :categories, only: [:show, :index]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
