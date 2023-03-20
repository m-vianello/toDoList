Rails.application.routes.draw do
  root to: "main#index"

  # get "/tasks_completed", to: "tasks#completed_index", as: :completed_tasks

  resources :tasks do
    get :complete
    patch :mark_complete

    get :in_progress
    patch :mark_in_progress
  end

  # post "/task/:id/complete" => "tasks#complete", :as => :complete_task
  # get "/task/:id/complete" => "tasks#mark_complete", :as => :mark_complete_task

end