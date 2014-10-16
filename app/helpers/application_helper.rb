module ApplicationHelper

	def render_date(date, options = {})
		date.strftime("%d %b")
	end

	def render_field(object, field, or_else = '-')
		object.send(field).present? ? object.send(field) : or_else
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
  
  # def render_menu(option = {}, &block)
 #    "<nav id='myNavmenu' class='navmenu navbar-default navmenu-default navmenu-fixed-right offcanvas' role='navigation'>
 #      <button type='button' class='navbar-toggle' data-toggle='offcanvas' data-target='#myNavmenu' data-canvas='body'>
 #        <span class='icon-bar'></span>
 #        <span class='icon-bar'></span>
 #        <span class='icon-bar'></span>
 #      </button>
 #        #{ link_to App.logo, root_path, class: 'navmenu-brand' }
 #          <ul class='nav navmenu-nav'>
 #            <li>#{ link_to 'Post an Ad (free)', new_classified_path }</li>
 #          </ul>
 #        <hr class='hr-dashed'></hr>
 #        #{ yield }
 #        <hr class='hr-dashed'></hr>
 #        #{ render partial: 'layouts/user_session_links' }
 #     </nav".html_safe
 #  end
 

end
