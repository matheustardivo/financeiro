require 'openid/store/filesystem'
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'o05IMwcXhJuwmBV4LvUsQA', 'X2s4rKI8GxpRkqhf88WP4XS72qIAp3FYaVJGUCbUUM4'
  # provider :facebook, '173215809371929', '3af0716a259e754e9097e4aa3fbf36f6'
  provider :linked_in, '9z1mKXIaovxQ_qBN7Blu1Fk2syWG_eMY-ZYVA6HfGenDixR1EeV6WM9TLs6XK52A', 'mgLJZNOXppDq2dp0zs_s8s3fXc5drDo_49y0jaMdg3IP5CYCKbAJmgruhauENo6w'
  provider :github, '11e35bf7ae50e30b9c4e', 'e95019ea41ffbbba8d5dab7dfb42ee0d9442758a'
  provider :open_id, OpenID::Store::Filesystem.new('/tmp')
  use OmniAuth::Strategies::OpenID, OpenID::Store::Filesystem.new('/tmp'), :name => 'google', :identifier => 'https://www.google.com/accounts/o8/id'
end