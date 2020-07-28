#!/usr/bin/env bash

inputOne=$1

function hello {
  echo $inputOne
  echo "isbased"
}

function nohello {
  echo "please stop"
}

hello
nohello
