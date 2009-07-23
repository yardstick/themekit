#!/usr/bin/env ruby -wKU
require 'fileutils'

module ThemeKit

  class Theme
    
    attr_reader :name, :path, :example_path
    
    def initialize(name, path)
      @name = name
      @path = path
      @example_path = File.join(File.dirname(__FILE__), '../../example_theme')
    end
    
    def create
      FileUtils.cp_r @example_path, File.join(@path, @name)
    end
    
    def self.render(html, options={})
      data = {
        :variations => 'default',
        :title => "Welcome | CompuGlobal Exams",
        :meta_tags => ThemeKit::Data::META_TAGS,
        :main_nav => ThemeKit::Data::MAIN_NAV,
        :user_nav => ThemeKit::Data::USER_NAV,
        :page_title => "Welcome to my website",
        :page_content => "#{ThemeKit::Data::DUMMY_HTML}<p>Yardstick ThemeKit: <strong>#{Time.now}</strong></p>",
        :system_stylesheet_path => "system.css",
        :stylesheet_path => "styles.css",
      }.merge(options)
      html.gsub!(/\{\{\s*theme_variation\s*\}\}/, data[:variations])                            # {{ theme_variation }}
      html.gsub!(/\{\{\s*title\s*\}\}/, data[:title])                                           # {{ title }}
      html.gsub!(/\{\{\s*page.title\s*\}\}/, data[:page_title])                                 # {{ page.title }}
      html.gsub!(/\{%\s*image image_data_id, (\w.*)\s*%\}/, "<img src=\"\\1\" />")              # {% image ... %}
      html.gsub!(/\{%\s*text text_data_id, (\w.*)\s*%\}/, "\\1")                                # {% text ... %}
      html.gsub!(/\{%\s*page_meta\s*%\}/, data[:meta_tags])                                     # {% page_meta %}
      html.gsub!(/\{%\s*menu main\s*%\}/, data[:main_nav])                                      # {% menu main %}
      html.gsub!(/\{%\s*menu account\s*%\}/, data[:user_nav])                                   # {% menu account %}
      html.gsub!(/\{\{\s*page.content\s*\}\}/, data[:page_content])                             # {{ page.content }}
      html.gsub!(/\{\{\s*system_stylesheet_path\s*\}\}/, data[:system_stylesheet_path])         # {{ system_stylesheet_path }}
      html.gsub!(/\{\{\s*stylesheet_path\s*\}\}/, data[:stylesheet_path])                       # {{ stylesheet_path }}
      html
    end
    
  end

end