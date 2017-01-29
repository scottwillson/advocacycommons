GroupType = GraphQL::ObjectType.define do
  name "Group"
  description "A group of beautiful people"
  field :name, types.String
  field :description, types.String
  field :featured_image_url, types.String
  field :creator do
    type PersonType
    resolve -> (obj, args, ctx) {
      obj.person
    }
  end
end
