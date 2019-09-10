# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RSAPublicKey do
  subject { create :rsa_public_key }

  describe '#pem' do
    it { is_expected.to validate_presence_of :pem }
  end

  describe '#bits' do
    it { is_expected.to validate_inclusion_of(:bits).in_array([2048, 4096]) }
  end
end