module HotBody

  def body_id
    body_id = controller.class.name.sub(/Controller$/, '').sub(/::/, '').underscore+'_page'
    body_id.sub!(/^devise_/, "devise_#{controller.scope_name}_") if body_id.match(/^devise_/)
    return body_id
  end

  def body_class
    controller.action_name+' '+(current_user ? ' signed_in' : '')
  end

end

module ApplicationHelper
  include HotBody
end

