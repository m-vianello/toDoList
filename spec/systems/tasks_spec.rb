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
      expect(current_path).to eql(new_task_path)
      expect(page).to have_content("New Task")
      fill_in "task[title]", with: "Call the Vet(system test)"
      fill_in "task[note]", with: "555-555-9000"
      fill_in "task[due_date]", with: "03/30/2023, 07:43 PM"
      fill_in "task[effort_level]", with: 1
      click_on "Create"

      expect(current_path).to eql(tasks_path)
      expect(page).to have_content("Task created!")
      expect(page).to have_content("In Progress(1)")
      expect(page).to have_content("Completed(0)")

      find("#view-button").click
      task = Task.find_by(title: "Call the Vet(system test)")

      expect(current_path).to eql(task_path(task.id))

      find("#edit-button").click
      expect(current_path).to eql(edit_task_path(task.id))
      fill_in "task[effort_level]", with: 3
      click_on "Update"
      expect(current_path).to eql(tasks_path)
      expect(page).to have_content("Task updated!")

      find("#complete-button").click
      expect(page).to have_content("Task completed!")
      expect(page).to have_content("In Progress(0)")
      expect(page).to have_content("Completed(1)")

      find("#completed-tab").click
      expect(page).to have_content("Call the Vet")

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