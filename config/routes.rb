Rails.application.routes.draw do
  namespace :admin do
    # resources :social_sharing isn't playing nicely in our extension
    match "social-sharing" => "social_sharing#index", :as => :social_sharing
    match "social-sharing/edit" => "social_sharing#edit", :as => :edit_social_sharing
    match "social-sharing/update" => "social_sharing#update", :as => :update_social_sharing
  end
end