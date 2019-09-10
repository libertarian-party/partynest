# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CreateX509SelfSignedCertificate do
  subject do
    described_class.call(
      private_key_pem: private_key_pem,
      public_key: public_key,
      distinguished_name: distinguished_name,
      not_before: not_before,
      not_after: not_after,
    )
  end

  let(:rsa_keys) { CreateRSAKeys.call }
  let(:private_key_pem) { rsa_keys.private_key_pem }
  let(:public_key) { rsa_keys.public_key }
  let(:distinguished_name) { "CN=#{Faker::Internet.domain_name}" }
  let(:not_before) { Faker::Time.backward.utc }
  let(:not_after) { Faker::Time.forward.utc }

  specify do
    expect { subject }.not_to raise_error
  end
end