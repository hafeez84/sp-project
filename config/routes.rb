Rails.application.routes.draw do
  namespace :api do
    get 'triangle/type'
    resources :posts do
      resources :comments
    end
  end
end
