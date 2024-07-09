Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'api/v1/sessions',
    registrations: 'api/v1/registrations',
    passwords: 'api/v1/passwords'
  }

  namespace :api do
    namespace :v1 do
      devise_scope :user do
        post 'sign_in', to: 'sessions#create'
        delete 'sign_out', to: 'sessions#destroy'
        post 'sign_up', to: 'registrations#create'
        post 'passwords/forgot', to: 'passwords#forgot'
        post 'passwords/reset', to: 'passwords#reset'
      end
      resources :contacts
       post 'users', to: 'registrations#create'
    end
  end
end
