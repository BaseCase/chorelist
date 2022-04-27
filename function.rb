require 'httparty'

def handler(event:, context:)
  response = HTTParty.get('http://example.com')
  puts response
end
