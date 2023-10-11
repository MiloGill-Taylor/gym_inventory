Rails.application.routes.draw do
  root 'static_pages#home'

  resources :gym_items, only: [:create, :edit, :update, :destroy]
  get 'gym_items/:id/toggle_use', to: 'gym_items#toggle_use', as: 'gym_items_toggle_use'
  post '/search',                 to: 'static_pages#search'
  get '/filter',                 to: 'static_pages#filter'
end
