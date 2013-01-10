#!/bin/bash
# This shell script was created at solowizard.com
#
# Usage:
#   Running the script remotely:
#     bash < <(curl -s http://www.solowizard.com/soloist_scripts/t7yk2o.sh )
#   Running the script if you have downloaded it:
#     ./t7yk2o.sh
#
# http://github.com/tommyh/solo_wizard
# (c) 2012, Tom Hallett
# This script may be freely distributed under the MIT license.

#TODO: install intellij idea 12.
#TODO: install tunnelblick.
#TODO: install spotify.
#TODO: install macvim.
#TODO: install twitter.
#TODO: install Google Chrome Canary.

pushd `pwd`
if rvm --version 2>/dev/null; then
  gem install soloist
else
  sudo gem install soloist
fi

mkdir -p ~/cookbooks; cd ~/cookbooks
cat > soloistrc <<EOF
cookbook_paths:
- $PWD
recipes:
- pivotal_workstation::ack
- pivotal_workstation::alfred
- pivotal_workstation::ccmenu
- pivotal_workstation::chrome
- pivotal_workstation::create_var_chef_cache
- pivotal_workstation::defaults_fast_key_repeat_rate
- pivotal_workstation::default_editor
- pivotal_workstation::dropbox
- pivotal_workstation::enable_assistive_devices
- pivotal_workstation::firefox
- pivotal_workstation::flycut
- pivotal_workstation::function_keys
- pivotal_workstation::git
- pivotal_workstation::github_for_mac
- pivotal_workstation::gitx
- pivotal_workstation::git_config_global_defaults
- pivotal_workstation::git_scripts
- pivotal_workstation::global_environment_variables
- pivotal_workstation::homebrew
- pivotal_workstation::imagemagick
- pivotal_workstation::increase_shared_memory
- pivotal_workstation::inputrc
- pivotal_workstation::iterm2
- pivotal_workstation::java
- pivotal_workstation::keyboard_preferences
- pivotal_workstation::keycastr
- pivotal_workstation::locate_on
- pivotal_workstation::menubar_preferences
- pivotal_workstation::menumeters
- pivotal_workstation::mouse_locator
- pivotal_workstation::mysql
- pivotal_workstation::node_js
- pivotal_workstation::postgres
- pivotal_workstation::qt
- pivotal_workstation::rvm
- pivotal_workstation::screen_sharing_app
- pivotal_workstation::sizeup
- pivotal_workstation::skype
- pivotal_workstation::sshd_on
- pivotal_workstation::textmate
- pivotal_workstation::textmate_bundles
- pivotal_workstation::textmate_preferences
- pivotal_workstation::tmux
- pivotal_workstation::unix_essentials
- pivotal_workstation::user_owns_usr_local
- pivotal_workstation::virtualbox
- pivotal_workstation::1password
- pivotal_workstation::evernote
- pivotal_workstation::zsh
EOF
if [[ -d pivotal_workstation ]]; then
  cd pivotal_workstation && git pull && cd ..
else
  git clone https://github.com/pivotal/pivotal_workstation.git
fi
if [[ -d dmg ]]; then
  cd dmg && git pull && cd ..
else
  git clone https://github.com/opscode-cookbooks/dmg.git
fi
soloist
popd
