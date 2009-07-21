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
      rescue
        missing = File.join(theme_directory, 'theme.html')
        return "<strong>Theme file doesn't exist:</strong> #{missing}"
      end
      
      html.gsub!(/\{\{\s*theme_variation\s*\}\}/, variations)                         # {{ title }}
      html.gsub!(/\{\{\s*title\s*\}\}/, "Welcome | CompuGlobal Exams")                # {{ title }}
      html.gsub!(/\{\{\s*page.title\s*\}\}/, "Welcome to my website")                 # {{ page.title }}
      html.gsub!(/\{%\s*image image_data_id, (\w.*)\s*%\}/, "<img src=\"\\1\" />")    # {% image ... %}
      html.gsub!(/\{%\s*text text_data_id, (\w.*)\s*%\}/, "\\1")                      # {% text ... %}
      html.gsub!(/\{%\s*page_meta\s*%\}/, ThemeKit::Data::META_TAGS)                                  # {% page_meta %}
      html.gsub!(/\{%\s*menu main\s*%\}/, ThemeKit::Data::MAIN_NAV)                                   # {% menu main %}
      html.gsub!(/\{%\s*menu account\s*%\}/, ThemeKit::Data::USER_NAV)                                # {% menu account %}
      html.gsub!(/\{\{\s*page.content\s*\}\}/, "#{ThemeKit::Data::DUMMY_HTML}<p>Yardstick ThemeKit: <strong>#{Time.now}</strong></p>")                            # {{ page.content }}
      html.gsub!(/\{\{\s*system_stylesheet_path\s*\}\}/, "system.css")                # {{ system_stylesheet_path }}
      html.gsub!(/\{\{\s*stylesheet_path\s*\}\}/, "styles.css")                       # {{ stylesheet_path }}

      return html
    end

  end
  
end
