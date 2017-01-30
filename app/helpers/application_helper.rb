module ApplicationHelper

  def full_title(page_title='')
    base_title = 'Application devis Madera'
    if page_title.empty?
      base_title
    else
      page_title + ' | ' + base_title
    end
  end

  def page_titles(title = '', subtitle = '')
    raw "<h1><strong>#{title}</strong> #{subtitle}</h1>"
  end

  def bootstrap_class_for flash_type
    case flash_type
      when 'success'
        'alert-success'
      when 'error'
        'alert-danger'
      when 'alert'
        'alert-danger'
      when 'notice'
        'alert-info'
      else
        flash_type.to_s
    end
  end

  def format_date date
    date.strftime('%d-%m-%Y')
  end
  
  def get_list_group_item class_ref, ctrl_ref
    rep = 'list-group-item'
    rep += ' disabled' if class_ref != nil && cannot?(:index, class_ref)
    rep += ' active' if controller.controller_name==ctrl_ref
    return rep
  end
  
  def get_list_group_link class_ref, link
    if can?(:index, class_ref)
      return link
    else
      return ''
    end
  end


end
