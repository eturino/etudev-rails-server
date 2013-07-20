# DATABASES
default['databox']['db_root_password'] = nil
default['etudev-rails-server']['db_root_password'] = nil

default['etudev-rails-server']['admin_keys'] = []
default['etudev-rails-server']['deploy_keys'] = []
default['etudev-rails-server']['apps_dir'] = "/home/apps"

default['etudev-rails-server']['admin_user'] = "devops"
default['etudev-rails-server']['deploy_user'] = "deploy"
default['etudev-rails-server']['apps_user'] = "apps"


# RUBY
default['etudev-rails-server']['ruby']['versions'] = %w(2.0.0-p247 1.9.3-p392)
default['etudev-rails-server']['ruby']['global_version'] = '1.9.3-p392'
default['etudev-rails-server']['ruby']['users'] = []
default['etudev-rails-server']['ruby']['gems'] = [
    {'name' => 'bundler'},
    {'name' => 'zeus', 'version' => '0.13.4.pre2' },
    {'name' => 'zeus', 'version' => '0.13.4.pre2' },
]

# SSH
default['etudev-rails-server']['ssh']['known_hosts'] = %w(bitbucket.org github.com)

# BASHIT
default['etudev-rails-server']['bashit_users'] = []
