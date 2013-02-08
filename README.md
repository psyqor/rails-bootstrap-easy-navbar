# RailsBootstrapNavbarHelper

RailsBootstrapNavbarHelper is a Ruby on Rails gem for creating a simple navigation bar with twitter-bootstrap styling. Navigation bar may only be a maximum of two levels.

Make sure you have the twitter bootstrap rails gem installed: gem 'twitter-bootstrap-rails'


## Installation

Add this line to your application's Gemfile:

    gem 'rails_bootstrap_easy_navbar'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rails_bootstrap_easy_navbar

## Usage
With RailsBootstrapNavbarHelper you can create a navbar with one method call containing your current page name and a JSON object. 

From within a view create a navbar with:
	<%= create_navbar(@current_page, @navbar_tabs) %>

The current page variable is the title of the current tab in string format
The navbar_tabs JSON object is a hash of name, path pairs. 

An example of a navbar_tabs JSON object describing 3 main tabs:
	{ 
		"Login" => login_path,
		"Tasks" => tasks_path,
		"Project" => projects_path
	}

To include subtabs simply create a main tab name key with a value of a hash describing each of the sub tabs. Note you can only do one level of subtabs. 
An example of a navbar_tabs JSON object describing 3 main tabs and 2 subtabs:
	{ 
		"Login" => login_path,
		"Tasks" => tasks_path,
		"Project" => {
						"Open Projects" => projects_open_path,
				        "Closed Projects" => projects_closed_path
				     }
	}

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
