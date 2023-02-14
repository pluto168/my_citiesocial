Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'products#index'  #會有products的controller,裏面會有index的action,同時會有index的view
end
