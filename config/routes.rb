Rails.application.routes.draw do
  resources :dannis
  get 'welcome/index'
  get 'messages/:id' => 'welcome#read'
  root 'welcome#index'
  post 'welcome/index' => 'welcome#put'
end
