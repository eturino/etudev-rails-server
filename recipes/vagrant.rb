#modifications for Vagrant server => all users into a single 'vagrant' user

node.default["databox"]["db_root_password"] = "root"

node.default["authorization"]["sudo"]["users"] = ["vagrant"]

node.default["etudev-rails-server"]["apps_dir"] = "/home/vagrant"
node.default["etudev-rails-server"]["apps_user"] = "vagrant"
node.default["etudev-rails-server"]["admin_user"] = "vagrant"
node.default["etudev-rails-server"]["deploy_user"] = "vagrant"

node.default["etudev-rails-server"]["bashit_users"] = ["vagrant"]
node.default["etudev-rails-server"]["ruby"]["users"] = ["vagrant"]

# do not include recipes, just prepare defaults attributes
#include_recipe "rbenv::vagrant"
#include_recipe "etudev-rails-server::default"