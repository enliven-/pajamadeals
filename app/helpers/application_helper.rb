module ApplicationHelper

  def render_date(date, options = {})
    date.strftime("%d %b")
  end

  def render_field(object, field, or_else = '-')
    object.send(field).present? ? object.send(field) : or_else
  end

  def render_mobile_number(number)
    "+91-#{number}"
  end

  def bootstrap_class_for flash_type
    case flash_type
    when "success"
      "alert-success"
    when "error"
      "alert-danger"
    when "alert"
      "alert-danger"
    when "notice"
      "alert-success"
    else
      flash_type.to_s
    end
  end

  def i(icon, options = {})    
    options[:class] = "fa fa-#{icon}#{' icon-white' if options[:white]} #{options[:class]}"
    nosep = options.delete(:nosep)
    content_tag(:i, '', options) + (nosep ? '' : ' ')
  end

  def render_menu(options = {}, &block)
    
    concat(content_tag(:div, class: 'container') do
      content_tag(:div, class: 'col-md-12') do
        content_tag(:div, class: 'navbar navbar-inverse navbar-fixed-top') do
          concat(button_tag(class: 'navbar-toggle', data: { target: '#myNavmenu', toggle: 'offcanvas', canvas: 'body'}) do
            3.times { content_tag(:span, class: 'icon-bar') }
          end)
          if options[:logo]
            concat(link_to(App.logo, root_path, class: 'navbar-brand'))
          else
            concat(form_tag(classifieds_path, class: 'navbar-form', method: :get) do
              content_tag(:div, class: 'input-group') do
                concat(search_field_tag(:q, '', placeholder: 'Search', class: 'form-control'))
                concat(content_tag(:span, class: 'input-group-btn') do
                  button_tag('<span class="fui-search"></span>'.html_safe, class: 'btn')
                end)
              end
            end)
          end
        end
      end
    end)

    content_tag(:nav, class: 'navmenu navbar-default navmenu-default navmenu-fixed-right offcanvas', id: 'myNavmenu', role: 'navigation') do
      concat(button_tag(class: 'navbar-toggle', data: { target: '#myNavmenu', toggle: 'offcanvas', canvas: 'body'}) do
        3.times { content_tag(:span, class: 'icon-bar') }
      end)
      concat(link_to(App.logo, root_path, class: 'navmenu-brand logo'))
      concat(content_tag(:ul, class: 'nav navmenu-nav') do
        content_tag(:li, link_to('Post an Ad (free)', new_classified_path))
      end)
      concat(content_tag(:hr, '', class: 'hr-dashed'))
      if block_given?
        concat(capture(&block))
      end
      concat(render(partial: 'layouts/user_session_links'))
    end
    
  end
end
