# Use this hook to configure devise mailer, warden hooks and so forth.
# Many of these configuration options can be set straight in your model.
Devise.setup do |config|
  config.secret_key = '755ef9869644fdd9e747fde35ddafbc3459709dfa23c721aa6bd5f256456bac6c5c08b9fa244d85e18d226687426c8cf4badceb37f3bc10daba90d707360fd0b'
  config.mailer_sender = 'sami.saada@gmail.com'

  require 'devise/orm/active_record'

  config.case_insensitive_keys = [ :email ]
  config.strip_whitespace_keys = [ :email ]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 10

  # Setup a pepper to generate the encrypted password.
  # config.pepper = 'cde728c3915410c690fcf9f62eb5adfd53e28563e94a643e70ea1a33351264f3d609d010149d7ded18b1bfe335a58ff3777f69193877bcd106c54b0c8f519d09'

  config.reconfirmable = true
  config.password_length = 8..128
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete

  config.omniauth :steam, ENV['STEAM_API_KEY']
end
