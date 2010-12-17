#!/usr/bin/env bash

set -e

function do_release() {
  git archive --format=zip -o "releases/bucktooth.$1.xpi" "$1"
}

if test ! -d releases ; then
  mkdir releases
fi
if test -z "$1" ; then
  for tag in `git tag` ; do
    do_release "$tag"
  done
else
  while test -n "$1" ; do
    do_release "$1"
    shift
  done
fi
