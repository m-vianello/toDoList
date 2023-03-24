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

  def handle_in_progress(task_in_progress)
    task_in_progress ? "disable" : "pink"
  end

  def handle_complete(task_in_progress)
    task_in_progress ? "pink" : "disable"
  end

  def handle_effort_level(effort_level)
    if effort_level === 1
      content_tag(:i, "" , class: "fa-solid fa-spoon green")
    elsif effort_level === 2
      safe_join([
        content_tag(:i, "" , class: "fa-solid fa-spoon blue"),
        content_tag(:i, "" , class: "fa-solid fa-spoon blue")
      ])
    elsif effort_level === 3
      safe_join([
        content_tag(:i, "" , class: "fa-solid fa-spoon pink"),
        content_tag(:i, "" , class: "fa-solid fa-spoon pink"),
        content_tag(:i, "" , class: "fa-solid fa-spoon pink")
      ])
    end
  end
end
