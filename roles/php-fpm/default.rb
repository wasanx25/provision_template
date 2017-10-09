include_recipe '../base'

execute 'sudo apt-get update -y && apt-get dist-upgrade -y'

include_cookbook 'git'
include_cookbook 'nginx'
include_cookbook 'php-fpm'
