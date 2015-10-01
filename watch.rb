require "logger"
require "yaml"
require "pathname"
require "fssm"
require "pry"

FSSM.monitor do
  puts "watching..."

  path("/home/vagrant/dev/src/github.com/r-fujiwara/goji-sample-for-makefile/") do
    glob("**/*.go")

    update do |base, relative|
      puts "3"
    end

  end
end
