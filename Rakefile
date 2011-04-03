require 'rake/clean'

# Search for gemspec file to extract information about gem
gemspec = eval(File.read(Dir["*.gemspec"].first))
targetgem = "#{gemspec.name}-#{gemspec.version}.gem"

CLOBBER.include(targetgem)

task :default => :build

desc "Build gem locally"
task :build => targetgem

desc "Install gem locally (might need sudo)"
task :install => :build do
  sh "gem install #{targetgem}"
end

desc "Run tests with local gem (might need sudo)"
task :test => [:install] + Dir['test/**/*.rb'] do 
  Dir['test/**/*.rb'].sort.each do |test|
    sh "ruby #{test}"
  end
end

task :devtest => Dir['test/**/*.rb', 'lib/**/*.rb'] do
  Dir['test/**/*.rb'].sort.each do |test|
    sh "ruby -I lib #{test}"
  end
end


# Validate Gemspec if some files have changed in Gem
rule '.gemspec' => proc{ |gemspec| eval(File.read(gemspec)).files } do |t|
  eval(File.read(t.name)).validate
  system "touch #{t.name}"
end

# Build a Gem from its Gemspec
rule '.gem' => proc{ |gem| gem.gsub(/-[0-9.]+\.gem$/, '.gemspec') } do |t|
  system "gem build #{t.source}"
  system "mv -f #{targetgem} #{t.name}"
end
