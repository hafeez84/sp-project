Rails.application.routes.draw do
  namespace :api do
    get 'triangle/type'
    get 'triangle/', to: 'triangle#index'
    resources :posts do
      resources :comments
    end
  end
end
