#!/usr/bin/env bash

# for each file beginning with underscore
# get the absolute path
for path in $(find $PWD -name "_*" -print)
do
  # get just the filename
  fname=$(basename $path);
  # symlink from a dotfile in home dir (taking off the underscore first!)
  ln -fs $path $HOME/.${fname##_}
done
