

describe bash('. ~/.bash_profile && ruby --version') do
    its('exit_status') { should eq 0 }
end

describe bash('. ~/.bash_profile && bundler --version') do
    its('exit_status') { should eq 0 }
end

describe file('/usr/local/bin/terraform') do
    it { should exist }
end


# test bundle install
bundler_test_install = <<-EOS
. ~/.bash_profile
cd /opt/default
bundle install
EOS

describe command(bundler_test_install) do
    its('exit_status') { should eq 0 }
end

# test bundle exec kitchen status
bundler_test_exec = <<-EOS
. ~/.bash_profile
cd /opt/default
bundle exec kitchen status
EOS

describe command(bundler_test_exec) do
    its('exit_status') { should eq 0 }
end
