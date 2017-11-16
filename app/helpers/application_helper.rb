module ApplicationHelper
  def flash_class(flash_type)
    case flash_type
      when :success then "alert alert-success"
      when :error then "alert alert-danger"
    end
  end
end
