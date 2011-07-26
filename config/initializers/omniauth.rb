require 'openid/store/filesystem'
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'KEY', 'SECRET'
  # provider :facebook, 'KEY', 'SECRET'
  provider :linked_in, 'KEY', 'SECRET'
  provider :github, 'KEY', 'SECRET'
  provider :open_id, OpenID::Store::Filesystem.new('/tmp')
  use OmniAuth::Strategies::OpenID, OpenID::Store::Filesystem.new('/tmp'), :name => 'google', :identifier => 'https://www.google.com/accounts/o8/id'
end
