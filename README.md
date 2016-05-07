# flash-messenger-rails

[![Build Status](https://api.travis-ci.org/emn178/flash-messenger-rails.png)](https://travis-ci.org/emn178/flash-messenger-rails)
[![Coverage Status](https://coveralls.io/repos/emn178/flash-messenger-rails/badge.svg?branch=master)](https://coveralls.io/r/emn178/flash-messenger-rails?branch=master)

Integrate with [flash-messenger](https://github.com/emn178/flash-messenger) to provide a simple flash messages. 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'flash-messenger'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install flash-messenger

## Usage

### Require Javascript
Add the following to /app/assets/javascripts/application.js:
```JavaScript
//= require flash-messenger
```

### Require CSS
Add the following to /app/assets/stylesheets/application.css:
```
/*
 *= require flash-messenger
 */
```

### Render
Add the following to view:
```
<%= show_flash %>
```
It will render flash messages if you assign some thing to `flash`.
```ruby
redirect_to root_path, :flash => {:error => 'Error!'}
# or
flash[:error] = 'Error!'
redirect_to root_path
```

### Helpers
In controller, you can use helper methods to output flash messages:
```ruby
flash_message('Successful!')
flash_message('Error!', :type => :error)
flash_notice('Notice!')
flash_alert('Alert!', :sticky => true)
flash_error('Error!')
```
You can also use it to show model errors:
```ruby
flash_model_error(model)
```

### Bootstrap
If you want to use bootstrap style, add the following to js file:
```JavaScript
//= require flash-messenger-bootstrap
```
Add the following to css file:
```
/*
 *= require flash-messenger-bootstrap
 */
```

### Turboboost
If you want turboboost to show errors, add the following to js file:
```JavaScript
//= require flash-messenger-turboboost
```

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Contact
The project's website is located at https://github.com/emn178/flash-messenger-rails  
Author: Chen, Yi-Cyuan (emn178@gmail.com)
