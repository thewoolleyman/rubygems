# You must ensure that rake, hoe, and minitest are already installed in specified RVM interpreter
export rvm_install_on_use_flag=1
export rvm_gemset_create_on_use_flag=1
echo "Using interpreter $1"
. $HOME/.rvm/environments/ruby-$1

echo "----------------------------"
echo "Build environment:"
cat /etc/issue
uname -a
ruby -v
gem env
gem list
echo "----------------------------"

# TODO: How can you make Hoe's check_extra_deps not use sudo?
#rake check_extra_deps default
rake default
