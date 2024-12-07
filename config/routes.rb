Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  get "accounts" => "account#get"
  post "accounts/create" => "account#create"
  get "accounts/balance" => "account#account_balance"
  delete "accounts/:id" => "account#destroy"

  post "/auth/login" => "authentication#login"

  scope :transaction do
    get "account_wallets" => "transaction#wallets"
    # post "create" => "transaction#create"
    post "top-up" => "transaction#top_up"
    post "withdraw" => "transaction#withdraw"
    post "transfer" => "transaction#transfer"
  end
end
