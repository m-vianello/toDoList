module TasksHelper
  def border_bottom(tasks, task)
    return "border-bottom" if task != tasks.last
  end

  def handle_show(disable_show)
    disable_show ? "disable" : "green"
  end

  def handle_edit(disable_edit)
    disable_edit ? "disable" : "blue"
  end

  def handle_completed(task_in_progress)
    task_in_progress ? "disable" : "pink"
  end
end