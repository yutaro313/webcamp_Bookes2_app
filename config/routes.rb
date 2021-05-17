Rails.application.routes.draw do
  devise_for :users
  root 'homes#top'
  get 'about', to: 'homes#about'
  resources :books
  resources :users

end
