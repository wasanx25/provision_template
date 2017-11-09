require 'spec_helper'

describe command('which git') do
  its(:stdout) { should match /\/usr\/local\/bin\/git/ }
end

describe command('git --version') do
  its(:stdout) { should match /git version 2\.14\.2/ }
end
