require "rails_helper"

RSpec.describe TasksController, type: :system do
  describe "clicking on the new task button" do
    it "creates the task and shows a success message" do
      visit tasks_path

      expect(page).to have_content("My ToDoList")

      find("#create-button").click

      expect(current_path).to eql(new_task_path)

      expect(page).to have_content("New Task")

      fill_in "task[title]", with: "Call the Vet"
      fill_in "task[note]", with: "555-555-9000"
      fill_in "task[due_date]", with: "03/30/2023, 07:43 PM"
      fill_in "task[effort_level]", with: 1

      expect(page).to have_button("Create")

      click_on "Create"

      expect(current_path).to eql(tasks_path)
      expect(page).to have_content("Task created!")
      expect(page).to have_content("Call the Vet")
    end
  end
end