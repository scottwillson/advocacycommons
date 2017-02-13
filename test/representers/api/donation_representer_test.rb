require 'test_helper'

class Api::DonationRepresenterTest < ActiveSupport::TestCase
  test 'to_json' do
    donation = Donation.new(
      currency: 'USD',
      amount: 10_000
    )

    json = JSON.parse(Api::DonationRepresenter.new(donation).to_json)

    assert_equal 'USD', json['currency'], 'currency'
    assert_equal 10_000, json['amount'], 'amount'
  end
end
