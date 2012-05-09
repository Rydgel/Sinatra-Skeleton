require "dalli"

def cache(timeout, cache_key)
  mc = Dalli::Client.new(ENV['MEMCACHE_SERVERS'], 
            :username => ENV['MEMCACHE_USERNAME'], 
            :password => ENV['MEMCACHE_PASSWORD'], 
            :expires_in => 300)

  rv = mc.get(cache_key)
  return rv if rv
  
  rv = yield
  mc.set(cache_key, rv, timeout)
  return rv
end