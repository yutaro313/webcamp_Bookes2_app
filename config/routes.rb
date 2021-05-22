Rails.application.routes.draw do
  devise_for :users
  root 'home#top'
  get '/home/about' => 'home#about'
  resources :books
  resources :users, only:[:create, :index, :show, :edit, :update]

end
