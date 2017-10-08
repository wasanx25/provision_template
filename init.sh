#! /bin/sh
set -ue


case "$(uname)" in
  "Darwin")
    curl -L -o provision_template.zip https://github.com/wataru0225/provision_template/archive/master.zip
    unzip provision_template.zip
    ;;
  "Linux")
    curl -L -o provision_template.tar.gz https://github.com/wataru0225/provision_template/archive/master.tar.gz
    tar xvfz provision_template.tar.gz
    ;;
  *)
    echo "unknown uname: $(uname)"
    exit 1
    ;;
esac

cd provision_template-master
sh install_mitamae.sh

if [ -n "$1" ]; then
  case $1 in
    "rails" ) bin/mitamae local roles/rails/default.rb ;;
    "php-fpm" ) bin/mitamae local roles/php-fpm/default.rb ;;
    * ) echo "Please select role in roles directory"
  esac
fi
