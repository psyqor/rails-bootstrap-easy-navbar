require 'rails_bootstrap_easy_navbar/navbar_helper'
module RailsBootstrapEasyNavbar
  class Railtie < Rails::Railtie
    initializer "rails_bootstrap_easy_navbar.navbar_helper" do
      ActionView::Base.send :include, NavbarHelper
    end
  end
end