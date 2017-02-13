require 'roar/json/hal'

class Api::RecipientRepresenter < Roar::Decorator
  include Roar::JSON::HAL

  property :amount
  property :display_name
  property :legal_name
end
