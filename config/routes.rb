Rails.application.routes.draw do
  resources :orders
  # devise_for :users, controllers: { sessions: 'users/sessions' }
  devise_for :users, controllers: { sessions: 'users/sessions', passwords: 'users/passwords', registrations: 'users/registrations' },
                        path: '',
                        path_names: { sign_in: '/sign_in', sign_out: '/sign_out' }

  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
