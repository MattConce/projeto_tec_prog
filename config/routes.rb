Rails.application.routes.draw do
  get 'sessions/new'

  root "static_pages#home"
  get    '/home',    to: 'static_pages#home'
  get    '/help',    to: 'static_pages#help'
  get    '/about',   to: 'static_pages#about'
  get    '/contact', to: 'static_pages#contact'
  get    '/signup',  to: 'users#new'
  post   '/signup',  to: 'users#create'
  get    '/register',  to: 'registers#new'
  post   '/register',  to: 'registers#create'
  post   '/edit',     to: 'posts#edit'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  #recurso que permite acesso a tabela de usuários no banco de dados
  #usuários tem acesso a seus posts
  resources :users
  resources :posts
  # resources :posts, only: [:create, :destroy]
  resources :registers

end
