module TasksHelper
  def border_bottom(tasks, task)
    return "border-bottom" if task != tasks.last
  end
end