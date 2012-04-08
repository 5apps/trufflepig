[![Build Status](https://secure.travis-ci.org/5apps/trufflepig.png?branch=master)](http://travis-ci.org/5apps/trufflepig)

Scans files and directories for scrummy truffles. And by truffles, we mean
shiny new features of HTML5, JavaScript APIs, CSS3, and friends. Obviously.

![Truffle pigs](http://5apps-assets.s3.amazonaws.com/trufflepig/trufflepig.png)

## Usage

```ruby
gem 'trufflepig', :require => 'trufflepig'
```

Send the truffle pig on its way:

```ruby
search = Trufflepig::Search.new "path/to/file/or/directory"
search.perform
```

Then look what it found:

```ruby
search.results
```

The results will consist of an array of feature objects, formatted exactly like
the caniuse.com/html5please.com source data, containing a description of the
feature as well as browser compatibility tables, and links to more info.

## Adding or updating detection patterns

Add or update patterns with the correct caniuse.com key to
[data/patterns.json](https://github.com/5apps/trufflepig/blob/master/data/patterns.json).
The build task will merge that list with the source JSON and create
data/features.json which will be used by the search:

```
rake featurelist:build
```

## To do

* Respect filetypes when scanning for features (e.g. don't look for CSS
  features in HTML code)
* Command line interface
* ...

## Contributing

We love pull requests. If you want to submit a patch:

* Fork the project.
* Make your feature addition or bug fix.
* Write specs for it. This is important so nobody breaks it in a future version unintentionally.
* Push to your fork and send a pull request.

## License

This gem is licensed under the MIT license. The feature data is originally from
[caniuse.com](http://caniuse.com) and published under the [CC BY-NC 3.0
license](http://creativecommons.org/licenses/by-nc/3.0/).
