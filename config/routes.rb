Rails.application.routes.draw do
  namespace :admin do
     match "social-sharing" => "social_sharing#index"
     match "social-sharing/edit" => "social_sharing#edit"
     match "social-sharing/update" => "social_sharing#update"
  end
end