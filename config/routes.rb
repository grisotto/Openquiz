Rails.application.routes.draw do
  resources :assuntos do

  resources :temas
end
resources :temas
  resources :questaos
  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
