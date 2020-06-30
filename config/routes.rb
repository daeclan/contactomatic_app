Rails.application.routes.draw do

  namespace :api do
    get "/contactomatic" => "contactos#contact_first_name"
  end

end
