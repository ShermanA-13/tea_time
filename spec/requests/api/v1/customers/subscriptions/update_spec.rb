require 'rails_helper'

RSpec.describe 'update subscription endpoint' do
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
    @oolong = Tea.create!(
      title: "Uncle Iroh's Oolong",
      description: 'ATL appreciation post',
      temperature: 159,
      brew_time: 'Between 1 to 4 minutes'
    )

    @sub_1 = Subscription.create(
      customer_id: @customer.id,
      tea_id: @green.id,
      title: 'Green Tea Fix',
      price: 12.50,
      frequency: :monthly
    )
    @sub_2 = Subscription.create(
      customer_id: @customer.id,
      tea_id: @oolong.id,
      title: 'Uncle Iroh 4 Lyfe',
      price: 16.50,
      frequency: :weekly,
      status: :cancelled
    )
  end

  context 'when response is successful' do
    it 'returns changed subscription status to cancelled' do
      patch "/api/v1/customers/#{@customer.id}/subscriptions/#{@sub_1.id}", params: { status: 'cancelled' }

      expect(response).to be_successful
      expect(response.status).to eq 200

      subs = JSON.parse(response.body, symbolize_names: true)

      expect(subs[:data][:attributes][:status]).to eq('cancelled')
    end

    it 'returns changed subscription status to active' do
      patch "/api/v1/customers/#{@customer.id}/subscriptions/#{@sub_2.id}", params: { status: 'active' }

      expect(response).to be_successful
      expect(response.status).to eq 200

      subs = JSON.parse(response.body, symbolize_names: true)

      expect(subs[:data][:attributes][:status]).to eq('active')
    end
  end

  context 'when response is not successful' do
    it 'returns error if subscription does not exist' do
      patch "/api/v1/customers/#{@customer.id}/subscriptions/1", params: { status: 'cancelled' }

      error = response.request.env['action_controller.instance']
      error_msg = JSON.parse(error.response_body[0], symbolize_names: true)

      expect(response).to_not be_successful
      expect(error_msg[:errors]).to eq('Subscription not found')
      expect(error.response.status).to eq 400
    end

    it 'returns error if subscription does not exist' do
      patch "/api/v1/customers/#{@customer.id}/subscriptions/1", params: { status: 'pending' }

      error = response.request.env['action_controller.instance']
      error_msg = JSON.parse(error.response_body[0], symbolize_names: true)

      expect(response).to_not be_successful
      expect(error_msg[:errors]).to eq('Status not valid')
      expect(error.response.status).to eq 400
    end
  end
end
