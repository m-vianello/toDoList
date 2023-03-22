require "rails_helper"

RSpec.describe TasksController, type: :request do
  describe "request list of all tasks" do
    context "when there are only in-progress tasks" do
      let!(:task) { create(:task) }

      it "renders the task list", :aggregate_failures do
        get tasks_path

        expect(response).to be_successful
        expect(response.body).to include(task.title)
      end
    end

    context "when there are in-progress and completed tasks" do
      let!(:task) { FactoryBot.create(:task) }
      let!(:completed_task) { FactoryBot.create(:task, :completed) }

      it "renders the task list", :aggregate_failures do
        get tasks_path

        expect(response).to be_successful
        expect(response.body).to include(task.title)
        expect(response.body).to include(completed_task.title)
      end
    end
  end

  describe "creating a task" do
    subject { post tasks_path, params: { task: { title: "bananas", effort_level: 1 } } }

    it "redirects to the tasks_path and creates a new record", :aggregate_failures do
      expect(Task.count).to eq(0)
      subject

      expect(response).to redirect_to(tasks_path)
      expect(Task.count).to eq(1)
    end
  end

  describe "updates task" do
    subject { patch task_path(task.id), params: { task: { title: "bananas"} } }

    let(:task) { create(:task) }

    it "redirects to the tasks_path and updates the task title", :aggregate_failures do
      subject

      expect(response).to redirect_to(tasks_path)
      expect(task.reload.title).to eq("bananas")
    end
  end

  describe "destroying a task" do
    subject { delete task_path(task.id) }

    let!(:task) { create(:task) }

    it "redirects to the tasks_path and destroys the task", :aggregate_failures do
      expect(Task.count).to eq(1)
      subject

      expect(response).to redirect_to(tasks_path)
      expect(Task.count).to eq(0)
    end
  end

  describe "updates task to complete" do
    subject { patch task_mark_complete_path(task.id), params: { task: { completed_at: completed_date } } }

    let(:task) { create(:task) }
    let(:completed_date) { Time.zone.now }

    it "redirects to the tasks_path and updates the task completed_at", :aggregate_failures do
      subject

      expect(response).to redirect_to(tasks_path)
      expect(task.reload.completed_at).to be_within(1.second).of(completed_date)
    end
  end

  describe "updates completed task to in progress" do
    subject { patch task_mark_in_progress_path(task.id), params: { task: { completed_at: nil } } }

    let(:task) { create(:task) }

    it "redirects to the tasks_path and updates the task completed_at", :aggregate_failures do
      subject

      expect(response).to redirect_to(tasks_path)
      expect(task.reload.completed_at).to eq(nil)
    end
  end
end