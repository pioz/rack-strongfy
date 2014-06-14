# Rack::Strongfy

Wrap specific words in a HTML page with `strong` tag.

## Installation

Add this line to your application's Gemfile:

    gem 'rack-strongfy', require: 'rack/strongfy'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rack-strongfy

In your `application.rb` add:

    config.middleware.use 'Rack::Strongfy'

Create the file `config/initializers/strongfy.rb`:

    Rack::Strongfy.word_list = %i(keyword1 keyword2)
    #Rack::Strongfy.selection_classes = %i(class1 class2)

The variable `word_list` specify the words that will be wrapped with the
`strong` tag. Will be wrapped only the words within the tags with the
classes specified in the variable `selection_classes`.

## Copyright

Copyright (c) 2014 [Enrico Pilotto (@pioz)]([https://github.com/pioz).
See [LICENSE](https://github.com/pioz/rack-strongfy/blob/master/LICENSE) for details.
