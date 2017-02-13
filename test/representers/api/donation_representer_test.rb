require 'test_helper'

class Api::DonationRepresenterTest < ActiveSupport::TestCase
  test 'to_json' do
    donation = Donation.new(
      amount: 10_000,
      created_at: Time.zone.local(2015, 11, 13, 23, 59, 59.999),
      currency: 'USD',
      id: 21,
      updated_at: Time.zone.local(2016, 1, 1)
    )

    json = JSON.parse(Api::DonationRepresenter.new(donation).to_json)

    assert_equal 'USD', json['currency'], 'currency'
    assert_equal 10_000, json['amount'], 'amount'
    assert_equal ['advocacycommons:21'], json['identifiers'], 'identifiers'
    assert_equal '2015-11-13T23:59:59.999Z', json['created_date']
    assert_equal '2016-01-01T00:00:00.000Z', json['modified_date']
  end
end
