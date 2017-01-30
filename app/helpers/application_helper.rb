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

  def menu_item label, link, action, model, controller_name = model.name.tableize.to_s
    css_class = 'list-group-item'
    css_class += ' disabled' if cannot? action, model
    css_class += ' active' if controller.controller_name == controller_name.to_s
    link_to(label, link, class: css_class)
  end

end
