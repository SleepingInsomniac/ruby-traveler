module Traveler
  require 'thor'
  
  class Project < Thor::Group
    include Thor::Actions
    
    argument :name, type: :string, desc: "Project name"
    
    # class_option :platforms, type: :array, desc: "Build platforms", default: ['osx','linux-x86','linux-x86_64']
    
    def vars
      @name = name
    end
    
    def structure
      empty_directory "#{@name}/packaging"
      template "app.rb.erb", "#{@name}/lib/app/app.rb"
      template "Rakefile.erb", "#{@name}/Rakefile"
      template "Gemfile.erb", "#{@name}/Gemfile"
      template "wrapper.sh.erb", "#{@name}/packaging/wrapper.sh"
      template "bundler-config.erb", "#{@name}/packaging/bundler-config"
      chmod "#{@name}/packaging/wrapper.sh", "+x"
    end
    
    def install
      inside @name do
        run "bundle"
        run "rake package DIR_ONLY=1"
      end
    end
    
  private
    def self.source_root
      File.expand_path File.join(File.dirname(__FILE__), "../templates/project/")
    end
  end
end