Rails.application.routes.draw do
  namespace :api do
    get "/contacts/index" => "contacts#index"
    post "/contacts" => "contacts#create"
    get "/contacts/:id" => "contacts#show"
    post "/users" => "users#create"
  end
end
