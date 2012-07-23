Rails.application.routes.draw do
  namespace :validation_admin do
    resources :validation_issues
  end
end
