namespace :featurelist do
  desc 'Build basic feature/pattern list from caniuse.com data plus pattern data'
  task :build do
    Truffelpig::FeatureList.build
  end
end
