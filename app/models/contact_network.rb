# frozen_string_literal: true

class ContactNetwork < ApplicationRecord
  CODENAME_RE = /\A[a-z][a-z0-9]*(_[a-z0-9]+)*\z/.freeze

  #############
  # Callbacks #
  #############

  before_validation :turn_blanks_into_nils
  before_validation :strip_extra_spaces

  ###############
  # Validations #
  ###############

  validates :codename,
            presence: true,
            length: { in: 3..36 },
            format: CODENAME_RE,
            uniqueness: { case_sensitive: false }

  validates :public_name, allow_nil: true, length: { in: 1..255 }

private

  def turn_blanks_into_nils
    self.codename    = nil if codename.blank?
    self.public_name = nil if public_name.blank?
  end

  def strip_extra_spaces
    self.codename    = codename&.strip
    self.public_name = public_name&.strip
  end
end
