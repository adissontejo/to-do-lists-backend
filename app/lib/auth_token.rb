# frozen_string_literal: true

# Authentication Token
class AuthToken
  SECRET_KEY = Rails.application.secrets.secret_key_base.to_s

  def self.encode(user_id)
    payload = { id: user_id }

    JWT.encode(payload, SECRET_KEY)
  end

  def self.decode(token)
    decoded = JWT.decode(token, SECRET_KEY)[0]

    decoded['id']
  end
end
