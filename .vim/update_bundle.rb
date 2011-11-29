#!/usr/bin/env ruby
# vim: ft=ruby

# from: http://tammersaleh.com/posts/the-modern-vim-config-with-pathogen

git_bundles = [ 
  "git://github.com/vim-scripts/pathogen.vim.git",
  "git://github.com/vim-scripts/surround.vim.git",
  "git://github.com/godlygeek/tabular.git",
  "git://github.com/scrooloose/nerdtree.git",
  "git://github.com/Lokaltog/vim-easymotion.git",
  "git://github.com/othree/html5.vim.git",
  "git://github.com/mattn/zencoding-vim.git",
  "git://github.com/Lokaltog/vim-powerline.git",
  "git://github.com/tpope/vim-fugitive.git",
  "git://github.com/scrooloose/syntastic.git",
]


require 'fileutils'

bundle_dir = File.expand_path('../bundle/', __FILE__)

git_bundles.each do |url|
  dirname = File.basename(url)
  puts "* Unpacking #{url} into #{dirname}"
  dir = File.join(bundle_dir, dirname)
  `cd #{dir} 2>/dev/null && git pull || git clone #{url} #{dir}`
end
