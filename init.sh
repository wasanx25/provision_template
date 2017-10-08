#! /bin/sh
set -ue

curl -L -o provision_template.zip https://github.com/wataru0225/provision_template/archive/master.zip
unzip provision_template.zip
# tar xvfz provision_template.tar.gz
cd provision_template-master
sh install_mitamae.sh

if [ -n "$1" ]; then
  case $1 in
    "rails" ) bin/mitamae local roles/rails/default.rb ;;
    "php-fpm" ) bin/mitamae local roles/php-fpm/default.rb ;;
    * ) echo "Please select role in roles directory"
  esac
fi
