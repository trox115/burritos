require 'rails_helper'
require 'httparty'

RSpec.describe 'Validates api for platforms' do
  context 'Validates API Call' do
    describe 'Validates GET Requests' do
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
    end
  end
  context 'Validates API field' do
    describe 'Validates fields present on get' do
      it 'It checks if returned values in platform A are same as docs' do
        response = HttParty.get("a/venue?api_key=#{Rails.application.credentials.api[:api_key]}")
        expect(response['name']).to be_a_kind_of(String)
        expect(response['address']).to be_a_kind_of(String)
        expect(response['category_id']).to be_a_kind_of(Integer)
        expect(response['closed']).to be_in([true, false])
        expect(response['hours']).to be_a_kind_of(String)
      end

      it 'It checks if returned values in platform B are same as docs' do
        response = HttParty.get("b/venue?api_key=#{Rails.application.credentials.api[:api_key]}")
        expect(response['name']).to be_a_kind_of(String)
        expect(response['street_address']).to be_a_kind_of(String)
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
  end
  context 'Validates API' do
    describe 'Validates Patch Requests' do
      it 'It checks if patch to platform A is possible' do
        response = HttParty.patch("a/venue?api_key=#{Rails.application.credentials.api[:api_key]}")
        expect(response.code).not_to be(404)
      end

      it 'It checks if patch to platform B is possible' do
        response = HttParty.patch("b/venue?api_key=#{Rails.application.credentials.api[:api_key]}")
        expect(response.code).not_to be(404)
      end

      it 'It checks if patch to platform C is possible' do
        response = HttParty.patch("c/venue?api_key=#{Rails.application.credentials.api[:api_key]}")
        expect(response.code).not_to be(404)
      end
    end
  end
end
