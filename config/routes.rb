Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :listings do
    resources :reservations
  end

  resources :trips do
    resources :reviews
  end

  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'

  scope :users, controller: :users do
    put '/:user_id/avatar' => :change_avatar
    get '/:user_id' => :show, as: "user"
  end
  
end
