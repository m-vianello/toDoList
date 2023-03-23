Rails.application.routes.draw do
  root to: "main#index"

  resources :tasks do
    patch :mark_complete

    patch :mark_in_progress
  end
end