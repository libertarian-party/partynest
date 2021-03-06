# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_after_action :verify_authorized
  skip_after_action :verify_policy_scoped

  # GET|POST /resource/auth/:provider
  def passthru
    super
  end

  # GET|POST /users/auth/:provider/callback
  def failure
    super
  end

  # GET|POST /users/auth/github/callback
  def github # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
    context = AuthenticateUserWithOmniauth.call(
      provider: auth_hash.provider,
      remote_id: auth_hash.uid,
      email: auth_hash.info.email,
    )

    if context.failure?
      set_flash_message! :alert, :failure,
                         kind: OmniAuth::Utils.camelize(:github),
                         reason: nil

      return redirect_to after_omniauth_failure_path_for(resource_name)
    end

    sign_in_and_redirect context.user
  end

private

  def auth_hash
    request.env['omniauth.auth']
  end

  # The path used when OmniAuth fails
  def after_omniauth_failure_path_for(_scope)
    super
  end
end
