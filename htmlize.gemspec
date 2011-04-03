Gem::Specification.new do |gem|
  gem.name = 'htmlize'
  gem.version = '1.0'
  gem.summary = 'Transform an HTML-like wiki content to valid HTML5'
  gem.description  = 'No description yet'
  gem.homepage = 'https://rubygems.org/gems/htmlize'
  gem.author = 'Vincent Robert'
  gem.email = 'vincent.robert@genezys.net'
  
  gem.files = Dir["{lib}/**/*.rb", "{lib}/**/*.rake", "{lib}/**/*.yml", "LICENSE", "README*"]
  
  gem.add_dependency 'nokogiri'
end