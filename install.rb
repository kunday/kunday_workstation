require 'yaml'

class Install
  def initialize
    @config = YAML.load_file(File.expand_path('../config.yml', __FILE__))
  end

  def run
    @config['brew'].map {|package| brew_install(package)}
    @config['cask'].map {|package| cask_install(package)}
  end
  private

  def brew_install(package)
    announce(package)
    `brew install #{package}`
  end

  def cask_install(package)
    announce(package)
    `brew cask install #{package}`
  end

  def announce(package)
    puts "===> Installing package (#{package})"
  end
end

Install.new.run
