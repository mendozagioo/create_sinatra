require 'fileutils'

class CreateSinatra
  def self.get_name_app(name)
    @name_app = name.downcase

    FileUtils.mkdir_p "../#{@name_app}"
    FileUtils.mkdir_p "../#{@name_app}/assets"
    FileUtils.mkdir_p "../#{@name_app}/assets/images"
    FileUtils.mkdir_p "../#{@name_app}/assets/javascripts"
    FileUtils.mkdir_p "../#{@name_app}/assets/stylesheets"

    FileUtils.mkdir_p "../#{@name_app}/config"
    FileUtils.mkdir_p "../#{@name_app}/config/locales"

    FileUtils.mkdir_p "../#{@name_app}/vendor"
    FileUtils.mkdir_p "../#{@name_app}/vendor/javascript"

    FileUtils.mkdir_p "../#{@name_app}/views"

    create_file
  end

  def self.create_file
    file_two = File.new "../#{@name_app}/assets/images/two.txt", "w"

    create_contains(file_two)
  end

  def self.create_contains(file)
    file.puts "#
algo aqui
    "
    file.close
  end
end

CreateSinatra.get_name_app(ARGV[0])
