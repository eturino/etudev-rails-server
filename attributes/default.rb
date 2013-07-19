# DATABASES
default['databox']['db_root_password'] = nil

# RUBY
default['etudev-rails-server']['ruby']['versions'] = %w(2.0.0-p247 1.9.3-p392)
default['etudev-rails-server']['ruby']['global_version'] = '1.9.3-p392'

# SSH
default['etudev-rails-server']['ssh']['known_hosts'] = %w(bitbucket.org github.com)

# BASHIT
default['etudev-rails-server']['bashit_users'] = []
