require 'fileutils'

class CreateSinatra
  def self.get_name_app(name)
    @name_app = name.downcase

    FileUtils.mkdir_p "../#{@name_app}"
    FileUtils.mkdir_p "../#{@name_app}/assets"
    FileUtils.mkdir_p "../#{@name_app}/assets/images"
    FileUtils.mkdir_p "../#{@name_app}/assets/javascripts"
    FileUtils.mkdir_p "../#{@name_app}/assets/stylesheets"
    FileUtils.mkdir_p "../#{@name_app}/assets/fonts"

    FileUtils.mkdir_p "../#{@name_app}/assets/stylesheets/config"
    FileUtils.mkdir_p "../#{@name_app}/assets/stylesheets/mixins"
    FileUtils.mkdir_p "../#{@name_app}/assets/stylesheets/pages"
    FileUtils.mkdir_p "../#{@name_app}/assets/stylesheets/ui"

    FileUtils.mkdir_p "../#{@name_app}/config"
    FileUtils.mkdir_p "../#{@name_app}/config/locales"

    FileUtils.mkdir_p "../#{@name_app}/vendor"
    FileUtils.mkdir_p "../#{@name_app}/vendor/javascript"

    FileUtils.mkdir_p "../#{@name_app}/views"

    create_file
  end

  def self.create_file
    file_app = File.new "../#{@name_app}/app.rb", "w"
    file_config = File.new "../#{@name_app}/config.ru", "w"
    file_gemfile = File.new "../#{@name_app}/Gemfile", "w"
    file_rakefile = File.new "../#{@name_app}/Rakefile", "w"
    file_readme = File.new "../#{@name_app}/README.md", "w"
    file_applicationjs = File.new "../#{@name_app}/assets/javascripts/application.js", "w"
    file_applicationsass = File.new "../#{@name_app}/assets/stylesheets/application.sass", "w"
    file_local_en = File.new "../#{@name_app}/config/locales/en.yml", "w"
    file_local_es = File.new "../#{@name_app}/config/locales/es.yml", "w"
    file_layout_view = File.new "../#{@name_app}/views/layout.haml", "w"
    file_index_view = File.new "../#{@name_app}/views/index.haml", "w"

    File.new "../#{@name_app}/assets/stylesheets/config/_responsive-large.sass", "w"
    File.new "../#{@name_app}/assets/stylesheets/config/_responsive-medium.sass", "w"
    File.new "../#{@name_app}/assets/stylesheets/config/_responsive-short.sass", "w"
    File.new "../#{@name_app}/assets/stylesheets/config/_variables.sass", "w"
    File.new "../#{@name_app}/assets/stylesheets/ui/_base.sass", "w"
    File.new "../#{@name_app}/assets/stylesheets/ui/_buttons.sass", "w"
    File.new "../#{@name_app}/assets/stylesheets/ui/_icons.sass", "w"
    File.new "../#{@name_app}/assets/stylesheets/ui/_lists.sass", "w"

    create_app_file(file_app)
    create_config_file(file_config)
    create_gemfile_file(file_gemfile)
    create_rakefile_file(file_rakefile)
    create_readme_file(file_readme)
    create_applicationjs_file(file_applicationjs)
    create_applicationsass_file(file_applicationsass)
    create_local_en_file(file_local_en)
    create_local_es_file(file_local_es)
    create_layout_view_file(file_layout_view)
    create_index_view_file(file_index_view)
  end

  def self.create_app_file(file)
    file.puts "# Base file
require \'bundler\'

Bundler.require

require \'sinatra/i18n\'
require \'sinatra/partial\'

class #{@name_app.capitalize} < Sinatra::Base
  register Sinatra::AssetPipeline
  register Sinatra::I18n

  set :root, File.dirname(__FILE__)
  set :assets_precompile, %w(application.js application.css *.png *.jpg *.svg *.ico *.otf *.eot *ttf)

  configure do
    sprockets.append_path File.join(root, \'assets\', \'stylesheets\')
    sprockets.append_path File.join(root, \'assets\', \'javascripts\')
    sprockets.append_path File.join(root, \'assets\', \'images\')
    sprockets.append_path File.join(root, \'assets\', \'fonts\')
    sprockets.append_path File.join(root, \'vendor\', \'javascripts\')

    I18n.default_locale = :en
  end

  configure :production do
    set :raise_errors, false
    set :show_exceptions, false
  end

  get \'/\' do
    haml :index
  end
end"
    file.close
  end

  def self.create_config_file(file)
    file.puts "# This file is used by Rack-based servers to start the application.

require File.join(File.dirname(__FILE__), \'app.rb\')

run #{@name_app.capitalize}.new"
    file.close
  end

  def self.create_gemfile_file(file)
    file.puts "# Gemfile
source \'https://rubygems.org\'

ruby \'2.0.0\'

gem \'sinatra\'
gem \'haml\'
gem \'i18n\'

gem \'sinatra-asset-pipeline\', require: \'sinatra/asset_pipeline\'
gem \'sinatra-i18n\', require: \'sinatra/i18n\'

gem \'shotgun\'

gem \'cactu\'

gem \'sinatra-partial\'"
    file.close
  end

  def self.create_rakefile_file(file)
    file.puts "# Rakefile
require \'sinatra/asset_pipeline/task.rb\'
require \'./app\'

Sinatra::AssetPipeline::Task.define! #{@name_app.capitalize}"
    file.close
  end

  def self.create_readme_file(file)
    file.puts "# #{@name_app.capitalize}
Is a simple Sinatra app

Please run bundle before to start:
    $ bundle install

Run the server with:
    $ shotgun"
    file.close
  end

  def self.create_applicationjs_file(file)
    file.puts "// application.js
//= require_tree ."
    file.close
  end

  def self.create_applicationsass_file(file)
    file.puts "@import \'cactu\'"
    file.close
  end

  def self.create_local_en_file(file)
    file.puts "en:
  title: \'Hello app\'"
    file.close
  end

  def self.create_local_es_file(file)
    file.puts "es:
  title: \'Hola app\'"
    file.close
  end

  def self.create_layout_view_file(file)
    stylesheet_path = '"#{stylesheet_path \'application\'}"'
    javascript_path = '"#{javascript_path \'application\'}"'
    image_path = '"#{image_path \'favicon.ico\'}"'

    file.puts "!!!
%html{lang: \"en\"}
  %head
    %meta{charset: \"utf-8\"}
    %meta{name: \'viewport\', content: \'width=device-width, initial-scale=1.0 maximum-scale=1.0\'}
    %title= t(\'title\')
    %meta{name: \"author\", content: \"Giovanni Mendoza\"}
    %meta{content: \'TITLE HERE\', property: \'og:title\'}
    %meta{content: \'URL HERE\', property: \'og:url\'}
    %meta{content: \'DESCRIPTION HERE\', property: \'og:description\'}
    %meta{content: \'NAME DESCRIPTION HERE\', name: \'description\'}
    %meta{name: \"keywords\", content: \"KEYWORDS HERE\"}
    %link{rel: \'stylesheet\', href: \"http://fonts.googleapis.com/css?family=Oswald:400,300,700&subset=latin\"}
    %link{rel: \'stylesheet\', href: #{stylesheet_path} }
    %link{rel: \"shortcut icon\", type: \"image/vnd.microsoft.icon\", href: #{image_path} }
  %body

    = yield

    %script{type: \"text/javascript\", charset: \"utf-8\", src: \"http://code.jquery.com/jquery-1.10.2.min.js\"}
    %script{src: #{javascript_path}}"
    file.close
  end

  def self.create_index_view_file(file)
    file.puts "%p= t(\'title\')"
    file.close
  end
end

CreateSinatra.get_name_app(ARGV[0])
