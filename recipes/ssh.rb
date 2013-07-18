node["etudev-rails-server"]["ssh"]["known_hosts"].each do |kh|
  ssh_known_hosts_entry kh
end