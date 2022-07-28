require 'rails_helper'

RSpec.describe 'create customer endpoint' do
  it 'creates a customer' do
    body = {
      first_name: 'Shernman',
      last_name: 'Au',
      email: 'sherman@email.com',
      address: '1234 Somewhere St.'
    }

    post '/api/v1/customers', params: body
    expect(response).to be_successful
    expect(response.status).to eq 201

    customer = JSON.parse(response.body, symbolize_names: true)

    expect(customer).to have_key(:data)
    expect(customer[:data]).to be_a Hash
    expect(customer[:data]).to have_key(:id)
    expect(customer[:data]).to have_key(:type)
    expect(customer[:data]).to have_key(:attributes)
    expect(customer[:data][:id]).to be_a String
    expect(customer[:data][:type]).to be_a String
    expect(customer[:data][:attributes]).to be_a Hash
    expect(customer[:data][:attributes]).to have_key(:first_name)
    expect(customer[:data][:attributes]).to have_key(:last_name)
    expect(customer[:data][:attributes]).to have_key(:email)
    expect(customer[:data][:attributes]).to have_key(:address)
    expect(customer[:data][:attributes][:first_name]).to be_a String
    expect(customer[:data][:attributes][:last_name]).to be_a String
    expect(customer[:data][:attributes][:email]).to be_a String
    expect(customer[:data][:attributes][:address]).to be_a String
  end

  context 'sad paths' do
    it 'cannot create if an attribute is missing' do
      body = {
        first_name: 'Shernman',
        last_name: 'Au',
        email: 'sherman@email.com'
      }

      post '/api/v1/customers', params: body

      expect(response).to_not be_successful
      expect(response.status).to eq 400
    end
  end
end
