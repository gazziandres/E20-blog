Rails.application.routes.draw do

	resources :posts do
		resources :comments, only: [:create, :destroy]
	end

  resources :pages do
    resources :dashboard, only: [:show]
  end

	devise_for :users, controllers: {
		sessions: 'users/sessions',
		registrations: 'users/registrations'
	}

	root 'posts#index'
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
