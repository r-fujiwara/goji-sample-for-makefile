require "logger"
require "yaml"
require "pathname"
require "fssm"
require "pry"

FSSM.monitor("./", "*.go") do
  puts "watching..."
  create do |base, relative|
    puts "3"
  end
end
