# == Route Map
#
#       Prefix Verb URI Pattern                        Controller#Action
#        login GET  /login(.:format)                   sessions#new
#       logout GET  /logout(.:format)                  sessions#destroy
#              GET  /auth/:provider/callback(.:format) sessions#create
# auth_failure GET  /auth/failure(.:format)            sessions#failure
#

Rails.application.routes.draw do
  get '', :to => 'events#index'
  get 'events/:id', :to => 'events#show', :as => 'event'
  get 'new', :to => 'events#new'
  post 'events', :to => 'events#create'

  get 'api/ping'

  get 'login', :to => 'sessions#new', :as => :login
  get 'logout', :to => 'sessions#destroy', :as => :logout
  get 'auth/:provider/callback', :to => 'sessions#create'
  get 'auth/failure', :to => 'sessions#failure'
end
