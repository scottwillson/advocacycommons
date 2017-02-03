require 'test_helper'

class Api::V1::PeopleControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  test '#index' do
    auth_headers = people(:one).create_new_auth_token
    get api_v1_people_url, headers: auth_headers, as: :json
    assert_response :success

    json = JSON.parse(response.body)
    assert json['_embedded'].present?

    people = json['_embedded']['osdi:people']
    assert_equal people.size, 2

    assert people.all? { |person| person['identifiers'].size == 1 }, 'Each person should have an identifier'
    assert people.all? { |person| person['created_date'].present? }, 'Each person should have created_date'
    assert people.all? { |person| person['modified_date'].present? }, 'Each person should have modified_date'
  end

  test 'require API token' do
    get api_v1_people_url as: :json
    assert_response 401
  end
end
