# == Route Map
#
#          Prefix Verb URI Pattern                           Controller#Action
#                 GET  /                                     events#index
#           event GET  /events/:id(.:format)                 events#show
#             new GET  /new(.:format)                        events#new
#          events POST /events(.:format)                     events#create
#     create_post POST /events/:event_id/posts(.:format)     posts#create
# create_resource POST /events/:event_id/resources(.:format) resources#create
#        api_ping GET  /api/ping(.:format)                   api#ping
#           login GET  /login(.:format)                      sessions#new
#          logout GET  /logout(.:format)                     sessions#destroy
#                 GET  /auth/:provider/callback(.:format)    sessions#create
#    auth_failure GET  /auth/failure(.:format)               sessions#failure
#

Rails.application.routes.draw do
  get '', :to => 'events#index'
  get 'events/:id', :to => 'events#show', :as => 'event'
  get 'new', :to => 'events#new'
  post 'events', :to => 'events#create'

  post 'events/:event_id/posts', :to => 'posts#create', :as => 'create_post'
  post 'events/:event_id/resources', :to => 'resources#create', :as => 'create_resource'

  get 'api/ping'

  get 'login', :to => 'sessions#new', :as => :login
  get 'logout', :to => 'sessions#destroy', :as => :logout
  get 'auth/:provider/callback', :to => 'sessions#create'
  get 'auth/failure', :to => 'sessions#failure'
end
