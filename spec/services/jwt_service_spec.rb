require 'rails_helper'

RSpec.describe JwtService do
  describe '.encode' do
    let(:user) { create(:user) }

    it 'returns a JWT token' do
      token = JwtService.encode(user_id: user.id)
      expect(token).to be_a(String)
    end
  end

  describe '.decode' do
    let(:user) { create(:user) }
    let(:token) { JwtService.encode(user_id: user.id) }

    it 'decodes a JWT token' do
      decoded_token = JwtService.decode(token)
      expect(decoded_token['user_id']).to eq(user.id)
    end
  end
end
