# similar to etudev-rails-server cookbook
#
#include_recipe "etudev-rails-server::default"


include_recipe "curl"
include_recipe "htop"
include_recipe "git"
include_recipe "tmux"


include_recipe "user"


allusers = [
    node["etudev-rails-server"]["apps_user"],
    node["etudev-rails-server"]["deploy_user"],
    node["etudev-rails-server"]["admin_user"]
].uniq

# check for special case when all are the same user
if allusers.length == 1

  user_account node["etudev-rails-server"]["deploy_user"] do
    comment "apps runner deployer and sysadmin"
    ssh_keys node["etudev-rails-server"]["deploy_keys"].concat(node["etudev-rails-server"]["admin_keys"])
  end

else
  user_account node["etudev-rails-server"]["apps_user"] do
    comment "apps runner"
  end

  user_account node["etudev-rails-server"]["deploy_user"] do
    comment "deployer"
    ssh_keys node["etudev-rails-server"]["deploy_keys"]
  end

  user_account node["etudev-rails-server"]["admin_user"] do
    comment "sysadmin"
    ssh_keys node["etudev-rails-server"]["admin_keys"]
  end
end

group node["etudev-rails-server"]["apps_user"] do
  action :modify
  members allusers
end

node.default["authorization"]["sudo"]["groups"] = [
    "sudo",
    node["etudev-rails-server"]["admin_user"],
    node["etudev-rails-server"]["deploy_user"] # workaround to enable deployer to restart app
].uniq

node.default["authorization"]["sudo"]["passwordless"] = true

include_recipe "sudo"

