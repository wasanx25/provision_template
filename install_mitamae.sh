#! /bin/sh
set -ue
version="1.5.1"

case "$(uname)" in
  "Darwin")
    file_name="mitamae-x86_64-darwin"
    ;;
  "Linux")
    file_name="mitamae-x86_64-linux"
    ;;
  *)
    echo "unknown uname: $(uname)"
    exit 1
    ;;
esac

wget "https://github.com/itamae-kitchen/mitamae/releases/download/v${version}/${file_name}"
chmod +x ${file_name}
mv ${file_name} bin/mitamae
