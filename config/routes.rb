# == Route Map
#
#                    Prefix Verb   URI Pattern                                                                              Controller#Action
#             confirm_users POST   /users/confirm(.:format)                                                                 users#confirm
#                saved_user GET    /users/:id/saved(.:format)                                                               users#saved
#                     users POST   /users(.:format)                                                                         users#create
#                  new_user GET    /users/new(.:format)                                                                     users#new
#                 edit_user GET    /users/:id/edit(.:format)                                                                users#edit
#                      user GET    /users/:id(.:format)                                                                     users#show
#                           PATCH  /users/:id(.:format)                                                                     users#update
#                           PUT    /users/:id(.:format)                                                                     users#update
#                  sessions POST   /sessions(.:format)                                                                      sessions#create
#               new_session GET    /sessions/new(.:format)                                                                  sessions#new
#                   session DELETE /sessions/:id(.:format)                                                                  sessions#destroy
#           confirm_entries POST   /entries/confirm(.:format)                                                               entries#confirm
#                   entries GET    /entries(.:format)                                                                       entries#index
#                           POST   /entries(.:format)                                                                       entries#create
#                 new_entry GET    /entries/new(.:format)                                                                   entries#new
#                edit_entry GET    /entries/:id/edit(.:format)                                                              entries#edit
#                     entry GET    /entries/:id(.:format)                                                                   entries#show
#                           PATCH  /entries/:id(.:format)                                                                   entries#update
#                           PUT    /entries/:id(.:format)                                                                   entries#update
#                           DELETE /entries/:id(.:format)                                                                   entries#destroy
#                   replies POST   /replies(.:format)                                                                       replies#create
#                     reply DELETE /replies/:id(.:format)                                                                   replies#destroy
#                     goods POST   /goods(.:format)                                                                         goods#create
#                      good DELETE /goods/:id(.:format)                                                                     goods#destroy
#               reply_goods POST   /reply_goods(.:format)                                                                   reply_goods#create
#                reply_good DELETE /reply_goods/:id(.:format)                                                               reply_goods#destroy
#                 bookmarks POST   /bookmarks(.:format)                                                                     bookmarks#create
#                  bookmark DELETE /bookmarks/:id(.:format)                                                                 bookmarks#destroy
#         letter_opener_web        /inbox                                                                                   LetterOpenerWeb::Engine
#        rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
# rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#        rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
# update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#      rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create
# 
# Routes for LetterOpenerWeb::Engine:
# clear_letters DELETE /clear(.:format)                 letter_opener_web/letters#clear
# delete_letter DELETE /:id(.:format)                   letter_opener_web/letters#destroy
#       letters GET    /                                letter_opener_web/letters#index
#        letter GET    /:id(/:style)(.:format)          letter_opener_web/letters#show
#               GET    /:id/attachments/:file(.:format) letter_opener_web/letters#attachment

Rails.application.routes.draw do
  resources :users, only: [:new, :create, :edit, :update, :show] do
    collection do
      post :confirm
    end

    member do
      get :saved
    end
  end

  resources :sessions, only: [:new, :create, :destroy]

  resources :entries do
    collection do
      post :confirm
    end
  end

  resources :replies, only: [:create, :destroy]

  resources :goods, only: [:create, :destroy]

  resources :reply_goods, only: [:create, :destroy]

  resources :bookmarks, only: [:create, :destroy]

  mount LetterOpenerWeb::Engine, at: "/inbox" if Rails.env.development?
end
