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
    
  end

end