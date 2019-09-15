# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GET /asymmetric_keys/new' do
  before do
    sign_in current_account.user if current_account&.user

    get '/asymmetric_keys/new'
  end

  for_account_types nil, :usual, :superuser do
    specify do
      expect(response).to have_http_status :ok
    end
  end
end