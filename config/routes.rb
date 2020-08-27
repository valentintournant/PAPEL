Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :receipts do
    collection do
      get :category_list
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

