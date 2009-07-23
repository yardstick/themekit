require 'rubygems'
require 'sinatra/base'

module ThemeKit

  class Server < Sinatra::Base

    get '/*' do

      system_stylesheet = options.system_stylesheet
      theme_directory = options.theme_directory

      # Get the path they're requesting.
      # If the path is empty, ie: "/", default to theme.html
      path = params[:splat][0]
      path = "theme.html" if path.length == 0

      if path == "system.css"
        file_path = system_stylesheet
        puts "** Rendering system stylesheet: #{file_path}"
      else
        file_path = File.join(theme_directory, path)
      end

      # Everything *except* theme.html can be statically served.
      return send_file(file_path) unless path == "theme.html"

      # Because sinatra is lame and doesn't keep GET variables when using
      # a splat in the route.
      begin
        variations = request.url.split("?")[1].gsub(/%20/, ' ')
      rescue
        variations = 'default'
      end

      puts "** Rendering theme with variations: #{variations}"
      
      begin
        html = File.open(file_path).read()
        return ThemeKit::Theme.render(html, {:variations => variations})
      rescue
        missing = File.join(theme_directory, 'theme.html')
        return "<strong>Theme file doesn't exist:</strong> #{missing}"
      end

    end

  end
  
end
