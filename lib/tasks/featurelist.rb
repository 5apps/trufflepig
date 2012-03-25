namespace :featurelist do
  desc 'Build basic feature/pattern list from caniuse.com data plus pattern data'
  task :build do
    Trufflepig::FeatureList.build
  end

  desc 'Dummy search'
  task :search do
    search = Trufflepig::Search.new("/Users/basti/src/5apps/example-apps/heliogram")
    search.perform
    puts search.results.inspect
  end
end
