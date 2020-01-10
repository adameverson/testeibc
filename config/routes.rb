Rails.application.routes.draw do
  resources :phases
  resources :boards
  get 'welcome/index'

  # adicionado
  root 'boards#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
