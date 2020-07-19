Rails.application.routes.draw do
  resources :messages, only: [:index]
  post 'send', to: 'messages#send_sms'
  post 'receive', to: 'messages#receive_sms'
  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'messages#index'
end
