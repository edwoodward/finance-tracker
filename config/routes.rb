Rails.application.routes.draw do
  devise_for :users
  root to: 'welcome#index'
  get 'portfolio', to: 'users#portfolio'
  get 'search_stock', to: 'stocks#search'
end
