include_recipe '../base'

execute 'sudo apt-get update -y && apt-get dist-upgrade -y'

include_cookbook 'git'
include_cookbook 'ruby'
include_cookbook 'nginx'
