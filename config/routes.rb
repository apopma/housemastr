Rails.application.routes.draw do
  get "/listings", to: "houses#show"
end
