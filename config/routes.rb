Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }

  resources :chat_rooms

  mount ActionCable.server => '/cable'

  root 'chat_rooms#index'
end
