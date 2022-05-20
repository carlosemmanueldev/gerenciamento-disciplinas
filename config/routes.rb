Rails.application.routes.draw do
  resources :ratings
  resources :lessons
  resources :students
  resources :classrooms
  root "sessions#new"

  resources :users
  resources :subjects
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'
end
