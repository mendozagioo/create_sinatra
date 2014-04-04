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

    copy_files
  end

  def self.copy_files
    FileUtils.cp "app/assets/javascripts/application.js", "../#{@name_app}/assets/javascripts/application.js"
    FileUtils.cp "app/assets/stylesheets/config/_responsive-large.sass", "../#{@name_app}/assets/stylesheets/config/_responsive-large.sass"
    FileUtils.cp "app/assets/stylesheets/config/_responsive-large.sass", "../#{@name_app}/assets/stylesheets/config/_responsive-medium.sass"
    FileUtils.cp "app/assets/stylesheets/config/_responsive-large.sass", "../#{@name_app}/assets/stylesheets/config/_responsive-short.sass"
    FileUtils.cp "app/assets/stylesheets/config/_responsive-large.sass", "../#{@name_app}/assets/stylesheets/config/_variables.sass"
    FileUtils.cp "app/assets/stylesheets/ui/_base.sass", "../#{@name_app}/assets/stylesheets/ui/_base.sass"
    FileUtils.cp "app/assets/stylesheets/ui/_buttons.sass", "../#{@name_app}/assets/stylesheets/ui/_buttons.sass"
    FileUtils.cp "app/assets/stylesheets/ui/_forms.sass", "../#{@name_app}/assets/stylesheets/ui/_forms.sass"
    FileUtils.cp "app/assets/stylesheets/ui/_icons.sass", "../#{@name_app}/assets/stylesheets/ui/_icons.sass"
    FileUtils.cp "app/assets/stylesheets/ui/_images.sass", "../#{@name_app}/assets/stylesheets/ui/_images.sass"
    FileUtils.cp "app/assets/stylesheets/ui/_lists.sass", "../#{@name_app}/assets/stylesheets/ui/_lists.sass"
    FileUtils.cp "app/assets/stylesheets/ui/_tables.sass", "../#{@name_app}/assets/stylesheets/ui/_tables.sass"
    FileUtils.cp "app/assets/stylesheets/ui/_texts.sass", "../#{@name_app}/assets/stylesheets/ui/_texts.sass"
    FileUtils.cp "app/assets/stylesheets/application.sass", "../#{@name_app}/assets/stylesheets/application.sass"
    FileUtils.cp "app/config/locales/en.yml", "../#{@name_app}/config/locales/en.yml"
    FileUtils.cp "app/config/locales/es.yml", "../#{@name_app}/config/locales/es.yml"
    FileUtils.cp "app/views/index.haml", "../#{@name_app}/views/index.haml"
    FileUtils.cp "app/views/layout.haml", "../#{@name_app}/views/layout.haml"
    FileUtils.cp "app/app.rb", "../#{@name_app}/app.rb"
    FileUtils.cp "app/config.ru", "../#{@name_app}/config.ru"
    FileUtils.cp "app/Gemfile", "../#{@name_app}/Gemfile"
    FileUtils.cp "app/Rakefile", "../#{@name_app}/Rakefile"
    FileUtils.cp "app/README.md", "../#{@name_app}/README.md"
  end
end

CreateSinatra.get_name_app(ARGV[0])
