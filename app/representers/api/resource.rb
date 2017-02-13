require 'roar/json/hal'

class Api::Resource < Roar::Decorator
  include Roar::JSON::HAL

  property :created_at, as: :created_date
  property :updated_at, as: :modified_date

  property :identifiers, exec_context: :decorator

  def identifiers
    ["advocacycommons:#{represented.id}"]
  end
end
