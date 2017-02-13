require 'roar/json/hal'

class Api::DonationRepresenter < Roar::Decorator
  include Roar::JSON::HAL

  property :amount
  property :currency
end
