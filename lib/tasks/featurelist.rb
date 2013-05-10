namespace :featurelist do
  desc 'Build basic feature/pattern list from caniuse.com data plus pattern data'
  task :build do
    Trufflepig::FeatureList.build
  end

  desc 'Fetch caniuse.com data from the official repository'
  task :fetch do
    require 'net/http'
    require 'net/https' if RUBY_VERSION < '1.9'

    uri = URI("https://raw.github.com/Fyrd/caniuse/master/data.json")
    target_path = File.join File.dirname(__FILE__), "..", "..", "data", "caniuse.json"

    Net::HTTP.start(uri.host, uri.port, :use_ssl => true) do |http|
      request = Net::HTTP::Get.new uri.to_s

      if response = http.request(request)
        open(target_path, "w") do |file|
          file.write(response.body)
        end
      end
    end
  end

  desc 'Fetch caniuse.com data and build new feature/pattern list'
  task :update => [:fetch, :build]

  desc 'Dummy search'
  task :search do
    search = Trufflepig::Search.new("/Users/basti/src/5apps/example-apps/heliogram")
    search.perform
    puts search.results.inspect
  end
end
