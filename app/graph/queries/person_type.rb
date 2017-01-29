PersonType = GraphQL::ObjectType.define do
  name "Person"
  description "An individual standing astride the world"
  field :email, types.String
end
