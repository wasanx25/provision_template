%w(
  build-essential
  curl
  libcurl4-openssl-dev
  libssl-dev
  libssl-dev
  libyaml-dev
  stow
  sudo
  wget
  zlib1g-dev
).each do |name|
  package name do
    action :install
  end
end


MINOR_VERSION = '2.4'
MAINTENANCE_VERSION = '2.4.2'
FILE_NAME = "ruby-#{MAINTENANCE_VERSION}"

execute "wget http://ftp.ruby-lang.org/pub/ruby/#{MINOR_VERSION}/#{FILE_NAME}.tar.gz"
execute "tar -zxvf #{FILE_NAME}.tar.gz"

["./configure --prefix=/usr/local/stow/#{FILE_NAME}", 'make', 'make install'].each do |cmd|
  execute cmd do
    cwd FILE_NAME
  end
end

execute "stow -Rv #{FILE_NAME}" do
  cwd '/usr/local/stow'
end

execute "rm -rf #{FILE_NAME}"

execute 'gem install bundler -v 1.16.0'
