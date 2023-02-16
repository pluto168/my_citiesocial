Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'products#index'  #會有products的controller,裏面會有index的action,同時會有index的view

  resources :products, only: [:index, :show] #products在前端不需要全部路徑
end