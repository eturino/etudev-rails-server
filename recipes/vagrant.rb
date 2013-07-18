#modifications for Vagrant server

node.default["authorization"]["sudo"]["users"] = ["vagrant"]

node.default["etudev-rails-server"]["bashit_users"] = ["vagrant"]

include_recipe "etudev-rails-server::default"