class JsonWebToken
  TOKEN_EXPIRATION = 1
  JWT_SECRET_KEY = Rails.application.secrets.secret_key_base

  def self.encode(person)
    payload = { person_id: person.id, person_role: person.class.name, exp: TOKEN_EXPIRATION.minutes.from_now.to_i }
    hmac_secret = JWT_SECRET_KEY
    token_person = JWT.encode(payload, hmac_secret, 'HS256')
    person.update(token_user: token_person)
    token_person
  end

  def self.decode(token)
    hmac_secret = JWT_SECRET_KEY
    token_person = JWT.decode(token, hmac_secret, true, { algorithm: 'HS256' })
    person_id = token_person[0]['person_id']
    person_role = token_person.first['person_role']
    [person_id, person_role]
  end

end