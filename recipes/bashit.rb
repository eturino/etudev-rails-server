
users = [
    node["etudev-rails-server"]["apps_user"],
    node["etudev-rails-server"]["admin_user"],
    node["etudev-rails-server"]["deploy_user"]
].concat(node["etudev-rails-server"]["bashit_users"]).uniq


repository = "git://github.com/eturino/bash-it"

users.each do |u|

  if !node['etc'].nil? && !node['etc']['passwd'].nil? && !node['etc']['passwd'][u].nil? && !node['etc']['passwd'][u]['dir'].nil?
    home_dir = node['etc']['passwd'][u]['dir']
  elsif !node['rbenv']['user_home_root'].nil?
    home_dir = ::File.join(node['rbenv']['user_home_root'], u)
  else
    home_dir = ::File.join(node['user']['home_root'], u)
  end

  home_folder = home_dir
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

