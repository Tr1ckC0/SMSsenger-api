Rails.application.routes.draw do
  resources :messages, only: [:index]
  get 'send', to: 'messages#send_sms'
  get 'receive', to: 'messages#receive_sms'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'messages#index'
end
