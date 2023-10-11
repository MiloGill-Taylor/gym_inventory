Rails.application.routes.draw do
  root 'static_pages#home'

  resources :gym_items, only: [:create, :edit, :update, :destroy]
end
