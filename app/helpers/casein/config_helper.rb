module Casein
  module ConfigHelper
    
    # Name of website or client — used throughout Casein.
    def casein_config_website_name
      'Casein'
    end

    # Filename of logo image. Ideally, it should be a transparent PNG around 140x30px
    def casein_config_logo
      'casein/casein.png'
    end

    # The server hostname where Casein will run
    def casein_config_hostname
      if Rails.env.production?
        'http://twalk.io'
      else
        'http://localhost:5000'
      end
    end

    # The sender address used for email notifications
    def casein_config_email_from_address
      'donotreply@caseincms.com'
    end
  
    # The initial page the user is shown after they sign in or click the logo. Probably this should be set to the first tab.
    # Do not point this at casein/index!
    def casein_config_dashboard_url
      url_for :controller => :casein, :action => :blank
    end
  
    # A list of stylesheets to include. Do not remove the core casein/casein, but you can change the load order, if required.
    def casein_config_stylesheet_includes
      %w[casein/casein casein/custom]
    end
  
    # A list of JavaScript files to include. Do not remove the core casein/casein, but you can change the load order, if required.
    def casein_config_javascript_includes
      %w[casein/casein casein/custom]
    end
    
  end
end