class Api::DonationRepresenter < Api::Resource
  property :amount
  property :credited_amount
  property :credited_date
  property :currency
  property :origin_system
  property :payment, decorator: Api::PaymentRepresenter
  property :referrer_data, decorator: Api::ReferrerDataRepresenter
  property :subscription_instance
  property :url
  property :voided_date
  property :voided?, as: :voided

  collection :recipients, decorator: Api::RecipientRepresenter
end
