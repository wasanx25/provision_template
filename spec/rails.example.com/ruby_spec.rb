require 'spec_helper'

describe command('which ruby') do
  its(:stdout) { should match /\/usr\/local\/bin\/ruby/ }
end

describe command('ruby -v') do
  its(:stdout) { should match /^ruby 2\.4\.2/ }
end

describe file('/usr/local/bin/ruby') do
  it { should be_symlink }
end

describe command('bundle --version') do
  its(:stdout) { should match /^Bundler version 1\.16\.0/ }
end
