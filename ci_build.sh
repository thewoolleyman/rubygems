# You must ensure that rake, hoe, and minitest are already installed in specified RVM interpreter
export rvm_install_on_use_flag=1
export rvm_gemset_create_on_use_flag=1
. $HOME/.rvm/environments/ruby-$1

# TODO: How can you make Hoe's check_extra_deps not use sudo?
#rake check_extra_deps default
# install gems manually for now
gem install -y 'rake' --no-ri --no-rdoc
gem install -y 'hoe' --no-ri --no-rdoc
gem install -y 'builder' -v '~> 2.1' --no-ri --no-rdoc
gem install -y 'hoe-seattlerb' -v '~> 1.2' --no-ri --no-rdoc
gem install -y 'minitest' -v '~> 1.4' --no-ri --no-rdoc
gem install -y 'session' -v '~> 2.4' --no-ri --no-rdoc

echo "----------------------------"
echo "Build environment:"
cat /etc/issue
uname -a
ruby -v
gem env
gem list
echo "----------------------------"

rake default
