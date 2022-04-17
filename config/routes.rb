Rails.application.routes.draw do
  get 'relatorio/index'
  devise_for :users, 
  controllers: {
    registrations: 'user/registrations'
  }
  root 'home#index'
  post "home", to: "home#new"
  patch "home", to: "home#update"
  get "home", to: "home#teste"

  #patch "cobranca/:id", to: "cobranca#update" 
end
