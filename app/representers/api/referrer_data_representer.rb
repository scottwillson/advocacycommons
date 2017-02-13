require 'roar/json/hal'

class Api::ReferrerDataRepresenter < Roar::Decorator
  include Roar::JSON::HAL

  property :source
  property :referrer
  property :url
end
