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
With RailsBootstrapEasyNavbar you can create a bootstrap styled navbar with one method call containing your current page name and a JSON object. 

From within a view create a navbar with:
<pre>
	create_navbar(@current_page, @navbar_tabs)
</pre>
The current page variable is the title of the current tab in string format

The navbar_tabs JSON object is a hash of name, path pairs. 
<pre>
An example of a navbar_tabs JSON object describing 3 main tabs:
	{ 
		"Login" => login_path,
		"Tasks" => tasks_path,
		"Project" => projects_path
	}
</pre>
To include subtabs simply create a main tab name key with a value of a hash describing each of the sub tabs. Only do one level of subtabs is supported. 
An example of a navbar_tabs JSON object describing 3 main tabs and 2 subtabs:
<pre>
{ 
	"Login" => login_path,
	"Tasks" => tasks_path,
	"Project" => {
					"Open Projects" => projects_open_path,
			        "Closed Projects" => projects_closed_path
			     }
}
</pre>
To create a responsive collapsible navbar:
<pre>
create_collapsible_navbar(@current_page, @navbar_tabs)
</pre>

The creation method takes an optional hash for styling and exending the navbar
Add a brand to the navbar:
<pre>
create_navbar(@current_page, @navbar_tabs, brand: "Website Title")
</pre>
Add a link for when the brand is clicked:
<pre>
create_navbar(@current_page, @navbar_tabs, brand: "Website Title", brand_path: '/projects')
</pre>
Change the Navbar class (Check out http://twitter.github.com/bootstrap/components.html#navbar for different classes):
<pre>
create_navbar(@current_page, @navbar_tabs, navbar_class: 'navbar navbar-inverse')
</pre>
Add raw html inside the non collapsible nav bar area:
<pre>	
create_navbar(@current_page, @navbar_tabs, navbar_raw_html: @navbar_raw_html)
</pre>

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
