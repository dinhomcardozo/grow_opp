Rails.application.routes.draw do
  get "licenses/new"
  get "licenses/edit"
  get "licenses/index"
  get "licenses/create"
  get "licenses/update"
  get "licenses/destroy"
  resources :sub_segments
  resources :segments
  resources :plans
  resources :stages
  resources :tax_regimes
  resources :sales_orders
  resources :quotes
  resources :opportunities
  resources :companies
  resources :contacts
  resources :licenses
  resources :products
  resources :clients
  resources :brands
  resources :tax_regimes
  resources :stages
  resources :plans
  resources :states do
    resources :cities
  end
  resources :segments do
    resources :sub_segments
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Para busca do contato na opportunity
  get 'contacts/search', to: 'contacts#search'
  # Para busca de companias na opportunity
  get 'companies/search', to: 'companies#search'

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"

  get '/favicon.ico', to: redirect('/assets/favicon.ico')
end
