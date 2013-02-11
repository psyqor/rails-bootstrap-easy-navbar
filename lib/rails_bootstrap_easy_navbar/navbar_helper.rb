module RailsBootstrapEasyNavbar
	module NavbarHelper
		DEFAULT_NAVBAR_CLASS = 'navbar'
		DEFAULT_BRAND_PATH = "/"
		
		def create_navbar(current_tab, nav_items, options={})
			options[:navbar_class] ||= DEFAULT_NAVBAR_CLASS
			content_tag(:div, navbar_inner(current_tab, nav_items, options), class: options[:navbar_class])
		end
		
		def create_collapsible_navbar(current_tab, nav_items, options={})
			options[:navbar_class] ||= DEFAULT_NAVBAR_CLASS
			options[:navbar_collapsible] = true
			content_tag(:div, navbar_inner(current_tab, nav_items, options), class: options[:navbar_class])
		end

		private  
		# Creates the navbar wrapper optionally containing a brand on the left hand side
		def navbar_inner(current_tab, nav_items, options={})
		    #create responsive collapsible layout if requested
		    contents = [
		    content_tag(:a, (content_tag(:span, nil, class: "icon-bar")*3).html_safe, class: "btn btn-navbar", 'data-toggle' => "collapse", 'data-target' => '.nav-collapse'),
		    content_tag(:div, content_tag(:ul, tabs(current_tab, nav_items), id: "tabs", class: "nav"), id: "navbar", class: 'nav-collapse collapse')
		    ] if options[:navbar_collapsible]
		
		    # skip responsive layout and create tabs if not requested
		    contents = [content_tag(:ul, tabs(current_tab, nav_items), id: "tabs", class: "nav")] if !options[:navbar_collapsible]
		
		    #create brand
		    if options[:brand]
		    options[:brand_path] ||= DEFAULT_BRAND_PATH
		    contents.insert(0, (content_tag(:a, options[:brand], href: options[:brand_path], class: "brand")))
		    end
		
		    #inject raw html if requested
		    contents << options[:navbar_raw_html] if options[:navbar_raw_html]
		
		    #create inner navbar
		    content_tag(:div, content_tag(:div, contents.join('').html_safe, class: 'container-fluid'), class: 'navbar-inner')
		end

		    # Creates HTML for a list of clickable tabs 
		def tabs(current_tab, nav_items)
        	nav_items.map do |tab_name, path|
	            if path.is_a? Hash # A Hash here means the tab is made up of multiple links -> dropdown 
	              	content_tag(:li, drop_down_tab(tab_name, path), class: "dropdown")
	          	else # construct and add a link to the list of tabs
		          	args = [:li, (link_to tab_name, path)]
		          	args << {class: "active"} if tab_name == current_tab
		          	content_tag(*args)
		        end
	        end.join(separator).html_safe
		end

		def separator
			content_tag(:li, nil, class: "divider-vertical")
		end

		def drop_down_tab(title, items)
			[content_tag(:a, dropdown_title(title), href: "#", class: "dropdown-toggle", 'data-toggle' => "dropdown"),
				content_tag(:ul, drop_down_links(items), class: "dropdown-menu")
			].join("").html_safe
		end

		def drop_down_links(items)
			items.map do |tab_name, path| 
				content_tag(:li, (link_to tab_name, path))
			end.join("").html_safe
		end

		def dropdown_title(title)
			dropdown_title = (title + " "+content_tag(:b, nil, class: "caret")).html_safe
		end
	end
end
