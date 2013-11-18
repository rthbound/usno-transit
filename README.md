# Usno::Transit [![Code Climate](https://codeclimate.com/github/rthbound/usno-transit.png)](https://codeclimate.com/github/rthbound/usno-transit)[![Coverage Status](https://coveralls.io/repos/rthbound/usno-transit/badge.png)](https://coveralls.io/r/rthbound/usno-transit)[![Build Status](https://travis-ci.org/rthbound/usno-transit.png?branch=master)](https://travis-ci.org/rthbound/usno-transit)

## Installation

Add this line to your application's Gemfile:

    gem 'usno-transit'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install usno-transit

## Usage

```ruby
require "usno/transit"
USNO::Transit::Sun.new(city: "Birmingham", state: "AL").call.data
```

the output of the above call will look something like the following

```html
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Rise/Set/Transit Table</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
<pre>
                                     Sun                                     
     
                             BIRMINGHAM, ALABAMA                             
              Location:  W 86°48'36.0", N33°31'48.0",     0m               
                 (Longitude referred to Greenwich meridian)                  
     
                    Time Zone:  6h 00m west of Greenwich                     
     
      Date         Begin      Rise  Az.   Transit Alt.    Set  Az.     End
     (Zone)        Civil                                              Civil  
                  Twilight                                           Twilight
                     h  m     h  m   °      h  m  °       h  m   °      h  m
2013 Nov 17 (Sun)   05:54    06:21 113     11:32 37S     16:43 247     17:10      
2013 Nov 18 (Mon)   05:55    06:22 113     11:33 37S     16:43 247     17:09      
2013 Nov 19 (Tue)   05:56    06:23 113     11:33 37S     16:42 247     17:09      
2013 Nov 20 (Wed)   05:57    06:24 113     11:33 37S     16:42 247     17:09      
2013 Nov 21 (Thu)   05:58    06:25 114     11:33 36S     16:42 246     17:08      

</pre>
<p><a href="javascript:history.go(-1)">Back to form</a></p>
</body>
</html>
```

## Other USNO libraries

[usno-imagery](http://github.com/rthbound/usno-transit) builds URLs for consuming USNO's imagery data services. These services provide synthetic views of earth and other selected solar system bodies.

## Contributing

If anyone wants to have a go at parsing the text/html output into JSON and/or CSV format (for graphing purposes), have at it! Otherwise, I'll be building that out in the near future.

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/rthbound/usno-transit/trend.png)](https://bitdeli.com/free "Bitdeli Badge")
