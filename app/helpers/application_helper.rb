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

end
