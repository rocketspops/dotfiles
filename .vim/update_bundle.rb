#!/usr/bin/env ruby
# vim: ft=ruby
# from: http://tammersaleh.com/posts/the-modern-vim-config-with-pathogen

git_bundles = [
  "git://github.com/vim-scripts/pathogen.vim.git",
  "git://github.com/vim-scripts/surround.vim.git",
  "git://github.com/scrooloose/nerdtree.git",
  "git://github.com/Lokaltog/vim-easymotion.git",
  "git://github.com/othree/html5.vim.git",
  "git://github.com/mattn/emmet-vim.git",
  "git://github.com/bling/vim-airline ",
  "git://github.com/nathanaelkane/vim-indent-guides.git",
  "git://github.com/tpope/vim-fugitive",
  "git://github.com/altercation/vim-colors-solarized.git",
  "git://github.com/kchmck/vim-coffee-script.git",
  "git://github.com/lvivski/vim-css-color.git",
  "git://github.com/kien/ctrlp.vim.git",
  "git://github.com/mileszs/ack.vim.git",
  "git://github.com/slim-template/vim-slim.git",
  "git://github.com/elzr/vim-json.git",
  "git://github.com/digitaltoad/vim-jade.git",
  "git://github.com/mattn/webapi-vim"
]

require 'fileutils'

bundle_dir = File.expand_path('../bundle/', __FILE__)

git_bundles.each do |url|
  dirname = File.basename(url)
  puts "* Unpacking #{url} into #{dirname}"
  dir = File.join(bundle_dir, dirname)
  `cd #{dir} 2>/dev/null && git pull || git clone #{url} #{dir}`
end
