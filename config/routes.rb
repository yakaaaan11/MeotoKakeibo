Rails.application.routes.draw do

  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }

  devise_scope :user do
    get "sign_in", :to => "users/sessions#new"
    get "sign_out", :to => "users/sessions#destroy"
  end


  root 'homes#top'
  get "profile" => 'homes#profile'
  get :dynamic_select_category, to: 'pays#dynamic_select_category'

  resources :incomes, only: [:new,:create,:edit,:update,:destroy ]

  resources :pays, only: [:index,:new,:create,:edit,:update,:destroy ] do

  end

  resources :reimbursements, only: [:index,:update] do
    collection do
      patch "update_husband"
      patch "update_wife"
    end
  end

  resources :families, only: [:index,:new,:create,:edit,:update,:destroy ]

  resources :budgets, only: [:index,:new,:create,:update,:destroy ]

  resource :deposits, only: [:new,:create]

  resources :categories, only: [:index,:show ]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



end
