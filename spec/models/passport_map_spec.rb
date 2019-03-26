# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PassportMap do
  subject { create :passport_map }

  it { is_expected.to belong_to :passport }

  it { is_expected.to validate_presence_of(:passport).with_message(:required) }

  it { is_expected.to validate_presence_of :first_name }
  it { is_expected.not_to validate_presence_of :middle_name }
  it { is_expected.to validate_presence_of :last_name }
  it { is_expected.to validate_presence_of :sex }
  it { is_expected.to validate_presence_of :date_of_birth }
  it { is_expected.to validate_presence_of :place_of_birth }
  it { is_expected.to validate_presence_of :series }
  it { is_expected.to validate_presence_of :number }
  it { is_expected.to validate_presence_of :issued_by }
  it { is_expected.to validate_presence_of :unit_code }
  it { is_expected.to validate_presence_of :date_of_issue }

  describe '#middle_name' do
    context 'when it is empty' do
      subject { create :passport_map, middle_name: '' }

      specify do
        expect(subject.middle_name).to eq nil
      end
    end

    context 'when it is blank' do
      subject { create :passport_map, middle_name: '   ' }

      specify do
        expect(subject.middle_name).to eq nil
      end
    end
  end
end
