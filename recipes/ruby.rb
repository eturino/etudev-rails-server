# install rbenv with several rubies and gems using cookbook "rbenv", :git => 'git://github.com/fnichol/chef-rbenv.git'

node.default['rbenv']['rubies'] = node["etudev-rails-server"]["ruby"]["versions"]
node.default['rbenv']['user_rubies'] = node["etudev-rails-server"]["ruby"]["versions"]


rubygems = {}
node["etudev-rails-server"]["ruby"]["versions"].each do |v|
  rubygems[v] = node["etudev-rails-server"]["ruby"]["gems"]
end

node.default['rbenv']['gems'] = rubygems

# users

users = [
    node["etudev-rails-server"]["apps_user"],
    node["etudev-rails-server"]["admin_user"],
    node["etudev-rails-server"]["deploy_user"]
].concat(node["etudev-rails-server"]["ruby"]["users"]).uniq

uinst = []

users.each do |u|

  if u.nil?
    p users
    raise 'An error has ocurred'
  end

  if !node['etc'].nil? && !node['etc']['passwd'].nil? && !node['etc']['passwd'][u].nil? && !node['etc']['passwd'][u]['dir'].nil?
    home_dir = node['etc']['passwd'][u]['dir']
  elsif !node['rbenv']['user_home_root'].nil?
    home_dir = ::File.join(node['rbenv']['user_home_root'], u)
  else
    home_dir = ::File.join(node['user']['home_root'], u)
  end

  uinst << {
      'user' => u,
      'home_dir' => home_dir
  }
end

node.default['rbenv']['user_installs'] = uinst

include_recipe 'rbenv::user_install'

users.each do |u|

  node["etudev-rails-server"]["ruby"]["versions"].each do |v|
    rbenv_ruby "#{v}" do
      user u
      action :install
    end

    node["etudev-rails-server"]["ruby"]["gems"].each do |g|

      rbenv_gem "#{g['name']}" do
        user u
        rbenv_version v
        version "#{g['version']}" unless g['version'].nil?
        action :install
      end

    end

  end

  unless node["etudev-rails-server"]["ruby"]["global_version"].nil?
    rbenv_global "#{node["etudev-rails-server"]["ruby"]["global_version"]}" do
      user u
    end
  end

end
