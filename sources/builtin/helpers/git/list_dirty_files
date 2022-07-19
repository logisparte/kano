#!/bin/sh

list_dirty_files() {
  git status --short | grep 'A\|M\|R' | awk '{print $NF}'
}
