maintainer        "Eduardo Turiño"
maintainer_email  "eturino@gmail.com"
description       "Configures server for rails applications"
version           "0.1.1"

recipe "etudev-rails-server", "run all standard recipes."
recipe "etudev-rails-server::vagrant", "run all standard recipes but prepending some custom config for vagrant"

recipe "etudev-rails-server::apt", "apt cookbook"
recipe "etudev-rails-server::time", "setup timezone"
recipe "etudev-rails-server::editor", "setup vim"
recipe "etudev-rails-server::ssh", "setup common ssh as known hosts"
recipe "etudev-rails-server::libs", "setup libs needed for compilation"
recipe "etudev-rails-server::nodejs", "setup node.js"
recipe "etudev-rails-server::ruby", "setup a ruby version manager `rbenv`."
recipe "etudev-rails-server::appbox", "appbox cookbook"
recipe "etudev-rails-server::db", "install databases (mysql and sqlite)"
recipe "etudev-rails-server::nginx", "install nginx"
recipe "etudev-rails-server::monit", "install monit"
recipe "etudev-rails-server::bashit", "setup custom bashit"



#basic server
depends "apt" # top level cookbook name, not recipe
depends "ntp"
depends "timezone-ii"

#editor
depends "vim"

#ssh
depends "partial_search"
depends "ssh_known_hosts"

#nodejs
depends "nodejs"

#ruby
depends "rbenv"

#appbox
depends "appbox"

#db
depends "databox" # to install mysql
depends "sqlite"

#nginx
depends "nginx"

#monit
depends "monit"
