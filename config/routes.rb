Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :teas, only: [:create]

      resources :customers, only: [:create] do
        resources :subscriptions, only: %i[index create update]
      end
    end
  end
end
