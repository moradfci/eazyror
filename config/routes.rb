Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
  namespace 'api' do
    namespace 'v1' do
      resources :trips
      resources :histories
      # get 'histories/report'
      post 'trips/update_status/:id/', to: 'trips#update_status'


    end
  end
end
