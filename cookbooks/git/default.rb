package 'git' do
  action :remove
end

%w(
  autoconf
  gettext
  libcurl4-gnutls-dev
  libexpat1-dev
  libssl-dev
  libz-dev
  stow
).each do |name|
  package name do
    action :install
  end
end


VERSION = '2.14.2'
FILE_NAME = "git-#{VERSION}"

execute "wget https://www.kernel.org/pub/software/scm/git/#{FILE_NAME}.tar.gz"
execute "tar -zxf #{FILE_NAME}.tar.gz"

["make configure", "./configure --prefix=/usr/local/stow/#{FILE_NAME}", "make", "make install"].each do |cmd|
  execute cmd do
    cwd FILE_NAME
  end
end

execute "stow -Rv #{FILE_NAME}" do
  cwd '/usr/local/stow'
end

execute "rm -rf #{FILE_NAME}"
