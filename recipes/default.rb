#1. apt
include_recipe "etudev-rails-server::apt"

#2. time
include_recipe "etudev-rails-server::time"

#3. editor
include_recipe "etudev-rails-server::editor"

#4. ssh
include_recipe "etudev-rails-server::ssh"

#5. libs
include_recipe "etudev-rails-server::libs"


#6. nodejs
include_recipe "etudev-rails-server::nodejs"

#7. ruby
include_recipe "etudev-rails-server::ruby"

#8. appbox
include_recipe "etudev-rails-server::appbox"


#9. database
include_recipe "etudev-rails-server::db"

#10. nginx
include_recipe "etudev-rails-server::nginx"

#11. monit
include_recipe "etudev-rails-server::monit"

#12. bashit
include_recipe "etudev-rails-server::bashit"

