Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :events, only: [:index, :show]
      resources :users, only: [:show, :update]
      post 'users/:id/events/:event_id', to: 'user_events#create'
      put 'users/:id/events/:event_id', to: 'user_events#update'
      delete 'users/:id/events/:event_id', to: 'user_events#destroy'
      namespace :users do
        get '/:id/events', to: 'events#index'
      end
    end
  end
end
