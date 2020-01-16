Rails.application.routes.draw do
  resources :tasks
  resources :phases
  resources :boards
  devise_for :users
  get 'welcome/index'

  # adicionado
  root 'boards#index'
  post 'boards/updatephasetask'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
