# frozen_string_literal: true

class Users::SessionPolicy < ApplicationPolicy
  def destroy?
    !account&.user.nil?
  end
end
