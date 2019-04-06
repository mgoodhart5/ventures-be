Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :events, only: [:index, :show]
      resources :users, only: [:show] 
      namespace :users do
        get '/:id/events', to: 'events#index'
      end
    end
  end
end
