require 'rails_helper'
require 'httparty'

RSpec.describe 'Validates api for platforms' do
  it 'Should return code 200 for platform A' do
    response = HttParty.get("a/venue?api_key=#{Rails.application.credentials.api[:api_key]}")
    expect(response.code).to eql(200)
  end

  it 'Should return code 200 for platform B' do
    response = HttParty.get("b/venue?api_key=#{Rails.application.credentials.api[:api_key]}")
    expect(response.code).to eql(200)
  end

  it 'Should return code 200 for platform C' do
    response = HttParty.get("c/venue?api_key=#{Rails.application.credentials.api[:api_key]}")
    expect(response.code).to eql(200)
  end

  it 'It checks if returned values in platform A are same as docs' do
    response = HttParty.get("a/venue?api_key=#{Rails.application.credentials.api[:api_key]}")
    expect(response['name']).to be_a_kind_of(String)
    expect(response['address']).to be_a_kind_of(String)
    expect(response['lat']).to be_present
    expect(response['lng']).to be_present
    expect(response['category_id']).to be_a_kind_of(Integer)
    expect(response['closed']).to be_in([true, false])
    expect(response['hours']).to be_a_kind_of(String)
  end

  it 'It checks if returned values in platform B are same as docs' do
    response = HttParty.get("b/venue?api_key=#{Rails.application.credentials.api[:api_key]}")
    expect(response['name']).to be_a_kind_of(String)
    expect(response['street_address']).to be_a_kind_of(String)
    expect(response['lat']).to be_present
    expect(response['lng']).to be_present
    expect(response['category_id']).to be_a_kind_of(Integer)
    expect(response['closed']).to be_in([true, false])
    expect(response['hours']).to be_a_kind_of(String)
  end

  it 'It checks if returned values in platform C are same as docs' do
    response = HttParty.get("c/venue?api_key=#{Rails.application.credentials.api[:api_key]}")
    expect(response['name']).to be_a_kind_of(String)
    expect(response['address_line_1']).to be_a_kind_of(String)
    expect(response['address_line_2']).to be_a_kind_of(String)
    expect(response['website']).to be_a_kind_of(String)
    expect(response['phone_number']).to be_a_kind_of(String)
    expect(response['closed']).to be_in([true, false])
    expect(response['hours']).to be_a_kind_of(String)
  end
end
