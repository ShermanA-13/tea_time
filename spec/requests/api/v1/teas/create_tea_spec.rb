require 'rails_helper'

RSpec.describe 'create tea endpoint' do
  it 'creates a tea' do
    body = {
      title: 'Green Tea',
      description: 'Organic Japanese Green Tea',
      temperature: 167,
      brew_time: 'Between 1 to 4 minutes'
    }

    post '/api/v1/teas', params: body

    expect(response).to be_successful
    expect(response.status).to eq 201

    tea = JSON.parse(response.body, symbolize_names: true)

    expect(tea).to have_key(:data)
    expect(tea[:data]).to be_a Hash
    expect(tea[:data]).to have_key(:id)
    expect(tea[:data][:id]).to be_a String
    expect(tea[:data]).to have_key(:type)
    expect(tea[:data][:type]).to be_a String
    expect(tea[:data]).to have_key(:attributes)
    expect(tea[:data][:attributes]).to be_a Hash
    expect(tea[:data][:attributes]).to have_key(:title)
    expect(tea[:data][:attributes][:title]).to be_a String
    expect(tea[:data][:attributes]).to have_key(:description)
    expect(tea[:data][:attributes][:description]).to be_a String
    expect(tea[:data][:attributes]).to have_key(:temperature)
    expect(tea[:data][:attributes][:temperature]).to be_an Integer
    expect(tea[:data][:attributes]).to have_key(:brew_time)
    expect(tea[:data][:attributes][:brew_time]).to be_a String
  end

  context 'sad path' do
    it 'returns error if no title provided' do
      body = {
        description: 'Organic Japanese Green Tea',
        temperature: 167,
        brew_time: 'Between 1 to 4 minutes'
      }

      post '/api/v1/teas', params: body

      expect(response).to_not be_successful
      expect(response.status).to eq 400
    end
  end
end
