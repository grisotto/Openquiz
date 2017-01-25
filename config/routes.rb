Rails.application.routes.draw do
  resources :assuntos do |assuntos|
  	resources :temas, :name_prefix => "assunto_"
end

resources :temas do |temas|
	resources :questaos, :name_prefix => "tema_"
end	
  resources :questaos
  mount Upmin::Engine => '/admin'
  root to: 'visitors#index'
  devise_for :users
  resources :users



  get "assuntos/:assunto_id/specializations" => "questaos#specializations", :as => "specializations", :format => :json
  post "temas/autoavaliacao" => "temas#autoavaliacao", :as => "autoavaliacao", :format => :json
end
