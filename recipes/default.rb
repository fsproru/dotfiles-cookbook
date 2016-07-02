#
# Cookbook Name:: dotfiles-cookbook
# Recipe:: default
#
# Copyright 2016, The Right Balance
#
# All rights reserved - Do Not Redistribute
#

home_path = File.expand_path('~/')
dotfiles_location = "#{home_path}/.dotfiles"
dotfiles_user = 'at'
dotfiles_group = 'staff'

git dotfiles_location do
  repository 'git@github.com:fsproru/dotfiles.git'
  action :checkout
  user dotfiles_user
  group dotfiles_group
  enable_checkout false
  checkout_branch 'master'
end

execute './install.sh' do
  user dotfiles_user
  group dotfiles_group
  cwd dotfiles_location
end
