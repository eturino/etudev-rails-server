packages = value_for_platform( ["redhat", "centos", "scientific", "amazon", "oracle"] => {
    "default" => %w(ruby-devel curl-devel sqlite-devel) },
                               ["ubuntu", "debian"] => {
                                   "default" => %w(ruby-dev libcurl4-gnutls-dev libsqlite3-dev) } )

packages.each do |devpkg|
  package devpkg
end
