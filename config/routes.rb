Rails.application.routes.draw do
  root to: "main#index"

  resources :tasks do
    get :complete
    patch :mark_complete
  end

  # post "/task/:id/complete" => "tasks#complete", :as => :complete_task
  # get "/task/:id/complete" => "tasks#mark_complete", :as => :mark_complete_task

end