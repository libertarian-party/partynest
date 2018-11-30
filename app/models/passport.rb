# frozen_string_literal: true

class Passport < ApplicationRecord
  enum sex: %i[male female]

  validates :surname, presence: true
  validates :given_name, presence: true
  validates :sex, presence: true
  validates :date_of_birth, presence: true
  validates :place_of_birth, presence: true
  validates :series, presence: true
  validates :number, presence: true
  validates :issued_by, presence: true
  validates :unit_code, presence: true
  validates :date_of_issue, presence: true

  before_validation do
    self.patronymic = nil if patronymic.blank?
  end
end