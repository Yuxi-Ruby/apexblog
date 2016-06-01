Apexblog::Application.routes.draw do
  root to: "static_pages#home"
  get "static_pages/index"

  devise_for :users

end
