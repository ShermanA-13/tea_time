require 'rails_helper'

RSpec.describe 'customer subscriptions endpoint' do
  context 'when response is successful' do
    it 'returns all subscriptions of a given customer' do
      customer = Customer.create!(
        first_name: 'Shernman',
        last_name: 'Au',
        email: 'sherman@email.com',
        address: '1234 Somewhere St.'
      )

      green = Tea.create!(
        title: 'Green Tea',
        description: 'Organic Japanese Green Tea',
        temperature: 167,
        brew_time: 'Between 1 to 4 minutes'
      )
      oolong = Tea.create!(
        title: "Uncle Iroh's Oolong",
        description: 'ATL appreciation post',
        temperature: 159,
        brew_time: 'Between 1 to 4 minutes'
      )

      sub_1 = Subscription.create(
        customer_id: customer.id,
        tea_id: green.id,
        title: 'Green Tea Fix',
        price: 12.50,
        frequency: :monthly
      )

      sub_2 = Subscription.create(
        customer_id: customer.id,
        tea_id: oolong.id,
        title: 'Uncle Iroh 4 Lyfe',
        price: 16.50,
        frequency: :weekly
      )

      get "/api/v1/customers/#{customer.id}/subscriptions"

      expect(response).to be_successful
      expect(response.status).to eq 200

      subs = JSON.parse(response.body, symbolize_names: true)

      expect(subs).to be_a Hash
      expect(subs).to have_key(:data)
      expect(subs[:data]).to be_a Array
      expect(subs[:data].count).to eq 2
    end

    context 'when response is not successfully' do
      it 'returns error if no customer found' do
        get '/api/v1/customers/1/subscriptions'

        expect(response).to_not be_successful
        expect(response.status).to eq 400

        error = JSON.parse(response.body, symbolize_names: true)

        expect(error).to have_key(:errors)
        expect(error[:errors]).to eq('Customer not found')
      end
    end
  end
end
