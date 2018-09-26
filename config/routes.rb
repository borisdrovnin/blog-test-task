Rails.application.routes.draw do
  post 'post/create'
  post 'post/rate'
  get 'post/top'
  get 'post/ip_logins'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
