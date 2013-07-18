include_recipe "apt"

# DOTDEB in debian >= 6
if node['platform'] == 'debian' && %w(wheezy squeeze).include?(node['lsb']['codename'])

  apt_repository "dotdeb" do
    uri "http://packages.dotdeb.org"
    distribution node['lsb']['codename']
    components ["all"]
    key "http://www.dotdeb.org/dotdeb.gpg"
  end

end

# 