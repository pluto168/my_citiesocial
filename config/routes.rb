Rails.application.routes.draw do
  devise_for :users,controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'products#index'  #會有products的controller,裏面會有index的action,同時會有index的view

  #前台
  resources :products, only: [:index, :show] #products在前端不需要全部路徑
  resources :categories, only: [:show]       #/category/2

  #後台
  namespace :astroser do
    root 'products#index'    # /astroser
    resources :products, except: [:show]
    resources :vendors, except: [:show]   #後台不需show,有新增,修改,刪除,列表
    resources :categories, except: [:show] do
      collection do
        put :sort     # PUT /astroser/categories/sort  拖拉
      end
    end
  end

  # POST /api/v1/subscribe
  # POST /api/v2/subscribe
  namespace :api do
    namespace :v1 do
      post 'subscribe', to: 'utils#subscribe'
    end
  end

end
