Rails.application.routes.draw do

  devise_for :users

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

  resources :budgets, only: [:index,:new,:create,:edit,:update, ]

  resources :deposits, only: [:new,:create]

  resources :categories, only: [:index,:create,:edit,:update,:destroy ]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



end
