Rails.application.routes.draw do

  # TODO:(2) add the route to read a receipt

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :receipts do
    collection do
      get :category_list
    end
    member do
      get 'read', to: 'receipts#read'
    end
  end
  # receipts-belong-group

  resources :cohorts do
    resources :members, only: [:create, :new]
  end
  resources :profiles, only: [:show] do
    collection do
      get :stats
    end
  end
end

