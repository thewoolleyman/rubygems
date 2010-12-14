# You must ensure that rake, hoe, and minitest are already installed in specified RVM interpreter
export rvm_install_on_use_flag=1
export rvm_gemset_create_on_use_flag=1
source $HOME/.rvm/environments/ruby-$1
rvm use $1

echo
echo "[CruiseControl] Build environment:"
echo "[CruiseControl]   $(cat /etc/issue)"
echo "[CruiseControl]   $(uname -a)"
echo "[CruiseControl]   $(ruby -v)"
echo "[CruiseControl]   gem env:"
gem env
echo "[CruiseControl]   gem list:"
gem list

# TODO: How can you make Hoe's check_extra_deps not use sudo?
#rake check_extra_deps default
rake default
