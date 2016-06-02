Rails.application.routes.draw do
  root to: "static_pages#home"

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  devise_for :users, :controllers => { registrations: 'registrations' }
end