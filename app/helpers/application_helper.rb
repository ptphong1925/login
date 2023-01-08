module ApplicationHelper
  include Pagy::Frontend
  def header_sort(text, direction)
    if direction == 'asc' 
      link_to text.capitalize, :sort => text, :direction => 'desc'

    elsif direction == 'desc'
      link_to text.capitalize, :sort => text, :direction => 'asc'
    else
      link_to text.capitalize, :sort => text, :direction => 'asc'
    end
  end

end
