## Lightspeed

A RubyGem to test your HTTP server's performance.


### Ping

Ping will issue the `ping` command with a count of 5. Then give back the average of the 5 pings as a result:

```ruby
require 'lightspeed/ping'

p = Lightspeed::Ping.new
p.ping("google.com") # => 5.035
```
