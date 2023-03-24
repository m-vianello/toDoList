require "rails_helper"

RSpec.describe TasksController, type: :system do
  describe "clicking on the new task button, viewing, editing, completing,
   marking in-progress, and destroying" do
    it do
      visit tasks_path

      expect(page).to have_content("My ToDoList")
      expect(page).to have_content("In Progress(0)")
      expect(page).to have_content("Completed(0)")

      find("#create-button").click
      expect(page).to have_current_path(new_task_path)
      expect(page).to have_content("New Task")
      fill_in "task[title]", with: "Create a system test"
      fill_in "task[note]", with: "install capybara"
      fill_in "task[due_date]", with: "03/30/2023, 07:43 PM"
      fill_in "task[effort_level]", with: 1
      click_on "Create"

      expect(page).to have_current_path(tasks_path)
      expect(page).to have_content("Task created!")
      expect(page).to have_content("In Progress(1)")
      expect(page).to have_content("Completed(0)")

      find("#view-button").click
      task = Task.find_by(title: "Create a system test")

      expect(page).to have_current_path(task_path(task.id))

      find("#edit-button").click
      expect(page).to have_current_path(edit_task_path(task.id))
      fill_in "task[effort_level]", with: 3
      click_on "Update"
      expect(current_path).to eql(tasks_path)
      expect(page).to have_content("Task updated!")

      find("#complete-button").click
      expect(page).to have_content("Task completed!")
      expect(page).to have_content("In Progress(0)")
      expect(page).to have_content("Completed(1)")

      find("#completed-tab").click
      expect(page).to have_content("Create a system test")

      find("#in-progress-button").click
      expect(page).to have_content("Task returned to in-progress!")
      expect(page).to have_content("In Progress(1)")
      expect(page).to have_content("Completed(0)")

      find("#destroy-button").click
      expect(page).to have_content("Task destroyed!")
      expect(page).to have_content("In Progress(0)")
      expect(page).to have_content("Completed(0)")
    end
  end
end