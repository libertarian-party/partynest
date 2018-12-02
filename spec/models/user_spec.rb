# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  subject { create(:account_with_user).user }

  it { is_expected.to belong_to(:account).required(false) }

  it { is_expected.to validate_uniqueness_of :account_id }
end
