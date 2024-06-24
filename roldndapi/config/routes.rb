Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  root "application#root"
  resources :spells
  resources :clases
  resources :magicschools
  get 'reset', to: 'spells#reset'
end
