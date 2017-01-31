require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do

  describe '#create' do
    context 'successful creation' do
      before do
        @valid_attributes = FactoryGirl.attributes_for(:user)
        post :create, params: { user: @valid_attributes }
      end

      it 'returns a status code of 201' do
        expect(response).to have_http_status(201)
      end

      it 'returns the json representation of the user object' do
        json_response = JSON.parse(response.body, symbolize_names: true)
        expect(json_response[:email]).to eql(@valid_attributes[:email])
        expect(json_response[:first_name]).to eql(@valid_attributes[:first_name])
      end
    end

    context 'unsuccessful creation' do
      before do
        post :create, params: { user: FactoryGirl.attributes_for(:invalid_user) }
      end

      it 'returns a status code of 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns the json representation of the errors object' do
        json_response = JSON.parse(response.body, symbolize_names: true)
        expect(json_response.has_key?(:errors)).to be true
      end

      it 'returns a json object with error message for invalid email' do
        json_response = JSON.parse(response.body, symbolize_names: true)
        expect(json_response[:errors][:email]).to eql(['can\'t be blank'])
      end
    end
  end
end
