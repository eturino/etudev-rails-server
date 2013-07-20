include_recipe "etudev-rails-server::appbox"

users = [
    node["etudev-rails-server"]["apps_user"],
    node["etudev-rails-server"]["admin_user"],
    node["etudev-rails-server"]["deploy_user"]
].concat(node["etudev-rails-server"]["bashit_users"]).uniq


repository = "git://github.com/eturino/bash-it"

users.each do |u|
  home_folder = "/home/#{u}"
  bashit_folder = "#{home_folder}/.bash_it"

  git bashit_folder do
    repository repository
    reference "master"
    action :sync
  end

  bash "install_bashit" do
    cwd bashit_folder
    code <<-EOH
    sudo #{bashit_folder}/auto_install_small.sh #{home_folder}
    EOH

    #not_if { ::File.exists?("#{module_location}/config") }

  end


end

