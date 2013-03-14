Rockr::Application.routes.draw do
  root :to => 'home#index'
  resources :venues, :concerts
end
