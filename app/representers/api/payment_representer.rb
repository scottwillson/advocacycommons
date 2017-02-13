require 'roar/json/hal'

class Api::PaymentRepresenter < Roar::Decorator
  include Roar::JSON::HAL

  property :authorization_stored?, as: :authorization_stored
  property :method
  property :reference_number
end
