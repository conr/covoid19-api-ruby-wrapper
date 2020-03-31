Gem::Specification.new do |s|
  s.name = 'covid19_api'
  s.version = '0.0.4'
  s.date = '2020-03-31'
  s.summary = 'COVID19 API ruby wrapper'
  s.description = 'Ruby wrapper for https://covid19api.com/'
  s.authors = ['Conor Broderick']
  s.email = 'cjayjayb@gmail.com'
  s.files = ['lib/covid19.rb']
  s.license = 'MIT'
  s.homepage = 'https://github.com/conr/covoid19-api-ruby-wrapper'
  s.add_runtime_dependency 'http', '~> 4.4', '>= 4.4.1'
  s.add_development_dependency 'rspec', '~> 3.9', '3.9.0'
end
