module ApplicationHelper
  def toggle_direction(current_sort, current_direction, target_sort)
    if current_sort == target_sort
      current_direction == 'asc' ? 'desc' : 'asc'
    else
      'asc'
    end
  end
end
