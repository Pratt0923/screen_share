Devise.setup do |config|
  # config.secret_key = '478311498ef4b325ce88e82180e069436d7f8fa9fce397d240bf577cd5e0832ce8a0e6e4f5cc1273dda5b1a33164af7ffe12ad74a0d1c4dc1d39616d62337ddc'

  # ==> Mailer Configuration
  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'

  # Configure the class responsible to send e-mails.
  # config.mailer = 'Devise::Mailer'

  # Configure the parent class responsible to send e-mails.
  # config.parent_mailer = 'ActionMailer::Base'

  # ==> ORM configuration
  # Load and configure the ORM. Supports :active_record (default) and
  # :mongoid (bson_ext recommended) by default. Other ORMs may be
  # available as additional gems.
  require 'devise/orm/active_record'
  # config.authentication_keys = [:email]
  # config.request_keys = []
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  # config.params_authenticatable = true
  # config.http_authenticatable_on_xhr = true

  # The realm used in Http Basic Authentication. 'Application' by default.
  # config.http_authentication_realm = 'Application'
  # config.paranoid = true
  config.skip_session_storage = [:http_auth]
  # config.clean_up_csrf_token_on_authentication = true
  # config.reload_routes = true

  # ==> Configuration for :database_authenticatable
  config.stretches = Rails.env.test? ? 1 : 11

  # config.pepper = '50aaad1b9b21c3cc266d79addf92005990cdb9f744ab9d72d3d358afca1b9d95a0a0823e8455507de96255176994ee85292cb6019988d6ae4b0ff619e6defde8'

  # config.send_password_change_notification = false

  # ==> Configuration for :confirmable
  # config.allow_unconfirmed_access_for = 2.days
  # config.confirm_within = 3.days
  config.reconfirmable = true

  # config.confirmation_keys = [:email]

  # ==> Configuration for :rememberable
  # config.remember_for = 2.weeks

  config.expire_all_remember_me_on_sign_out = true
  # config.extend_remember_period = false
  # config.rememberable_options = {}

  # ==> Configuration for :validatable
  # Range for password length.
  config.password_length = 6..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/

  # ==> Configuration for :timeoutable
  # config.timeout_in = 30.minutes

  # ==> Configuration for :lockable
  # :failed_attempts = Locks an account after a number of failed attempts to sign in.
  # :none            = No lock strategy. You should handle locking by yourself.
  # config.lock_strategy = :failed_attempts

  # Defines which key will be used when locking and unlocking an account
  # config.unlock_keys = [:email]

  # Defines which strategy will be used to unlock an account.
  # :email = Sends an unlock link to the user email
  # :time  = Re-enables login after a certain amount of time (see :unlock_in below)
  # :both  = Enables both strategies
  # :none  = No unlock strategy. You should handle unlocking by yourself.
  # config.unlock_strategy = :both
  # config.maximum_attempts = 20
  # config.unlock_in = 1.hour
  # config.last_attempt_warning = true

  # ==> Configuration for :recoverable
  # config.reset_password_keys = [:email]
  config.reset_password_within = 6.hours
  # config.sign_in_after_reset_password = true

  # ==> Configuration for :encryptable
  # config.encryptor = :sha512

  # ==> Scopes configuration
  # config.scoped_views = false
  # config.default_scope = :user
  # config.sign_out_all_scopes = true

  # ==> Navigation configuration
  config.sign_out_via = :delete

  # ==> OmniAuth
  config.omniauth :google_oauth2, "#{ENV['GOOGLE_PLUS_KEY']}", "#{ENV['GOOGLE_CLIENT_SECRET']}", { }

  # ==> Warden configuration
  # config.warden do |manager|
  #   manager.intercept_401 = false
  #   manager.default_strategies(scope: :user).unshift :some_external_strategy
  # end

  # ==> Mountable engine configurations
  #     mount MyEngine, at: '/my_engine'
  #
  # The router that invoked `devise_for`, in the example above, would be:
  # config.router_name = :my_engine
  #
  # When using OmniAuth, Devise cannot automatically set OmniAuth path,
  # so you need to do it manually. For the users scope, it would be:
  # config.omniauth_path_prefix = '/my_engine/users/auth'
end
