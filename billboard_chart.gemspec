
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "billboard_chart/version"

Gem::Specification.new do |spec|
  spec.name          = "billboard_chart"
  spec.version       = BillboardChart::VERSION
  spec.authors       = ["Isaac Villicana"]
  spec.email         = ["villicana.i@gmail.com"]

  spec.summary       = %q{This gem (billboard_chart) includes a CLI shows a user the 'Billboard Hot 100' list.}
  spec.description   = %q{Scrapes data from https://www.billboard.com/charts/hot-100 and allows a user to see the chart in an organized manner. Selecting a song from the list will display the user with additional information about that song.}
  spec.homepage      = "https://github.com/ivillicana/billboard_chart"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_dependency "nokogiri", "~> 1.8"
  spec.add_dependency "require_all", "~> 2.0"
end
