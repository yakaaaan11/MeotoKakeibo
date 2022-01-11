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

  resources :incomes, only: [:new,:create,:edit,:update,:destroy ]

  resources :pays, only: [:index,:new,:create,:edit,:update,:destroy ]

  resources :reimbursements, only: [:index] do
    collection do
      patch "reimbursement"
    end
  end

  resources :families, only: [:index,:new,:create,:edit,:update,:destroy ]

  resource :budgets, only: [:index,:new,:create,:edit,:update, ]

  resource :deposits, only: [:new,:create]

  resources :categories, only: [:index,:show ]



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



end
