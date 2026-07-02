Rails.application.routes.draw do
  post "score", to: "games#score"

  get "new", to: "games#new"
end
