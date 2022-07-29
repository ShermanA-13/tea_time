require 'rails_helper'

RSpec.describe 'create subscription endpoint' do
  before do
    @customer = Customer.create!(
      first_name: 'Shernman',
      last_name: 'Au',
      email: 'sherman@email.com',
      address: '1234 Somewhere St.'
    )

    @green = Tea.create!(
      title: 'Green Tea',
      description: 'Organic Japanese Green Tea',
      temperature: 167,
      brew_time: 'Between 1 to 4 minutes'
    )
  end
  it 'creates a subscription for a customer to a given tea' do
    body = {
      tea_id: @green.id,
      title: 'Green Tea Fix',
      price: 12.50,
      frequency: :monthly
    }

    post "/api/v1/customers/#{@customer.id}/subscriptions", params: body

    expect(response).to be_successful
    expect(response.status).to eq 201

    subs = JSON.parse(response.body, symbolize_names: true)

    expect(subs).to be_a Hash
    expect(subs).to have_key(:data)
    expect(subs[:data]).to be_a Hash
    expect(@customer.subscriptions[0].tea_id).to eq(@green.id)
    expect(@customer.subscriptions[0].title).to eq(body[:title])
    expect(@customer.subscriptions[0].price).to eq(body[:price])
    expect(@customer.subscriptions[0].frequency).to eq(body[:frequency].to_s)
  end

  context 'when response is unsucessful' do
    it 'returns error if tea is invalid' do
      body = {
        tea_id: 12_341_234,
        title: 'Green Tea Fix',
        price: 12.50,
        frequency: :monthly
      }

      post "/api/v1/customers/#{@customer.id}/subscriptions", params: body

      expect(response).to_not be_successful
      expect(response.status).to eq 400
    end

    it 'returns error if customer is invalid' do
      body = {
        tea_id: 12_341_234,
        title: 'Green Tea Fix',
        price: 12.50,
        frequency: :monthly
      }

      post '/api/v1/customers/1231231/subscriptions', params: body
      error = response.request.env['action_controller.instance']
      error_msg = JSON.parse(error.response_body[0], symbolize_names: true)

      expect(response).to_not be_successful
      expect(error_msg[:errors]).to eq('Customer not found')
      expect(error.response.status).to eq 400
    end

    it 'returns error if attributes are missing' do
      body = {
        tea_id: @green.id
      }

      post "/api/v1/customers/#{@customer.id}/subscriptions", params: body
      error = response.request.env['action_controller.instance']
      error_msg = JSON.parse(error.response_body[0], symbolize_names: true)

      expect(response).to_not be_successful
      expect(error_msg[:errors]).to eq([
                                         "Title can't be blank",
                                         "Price can't be blank",
                                         "Frequency can't be blank"
                                       ])
      expect(error.response.status).to eq 400
    end
  end
end
