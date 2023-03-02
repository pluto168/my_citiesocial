Rails.application.routes.draw do
  devise_for :users,controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'products#index'  #會有products的controller,裏面會有index的action,同時會有index的view

  resources :products, only: [:index, :show] #products在前端不需要全部路徑

  #後台
  namespace :astroser do
    root 'products#index'    #/astroser
    resources :products
    resources :vendors, expect: [:show]   #後台不需show,有新增,修改,刪除,列表
  end
end
