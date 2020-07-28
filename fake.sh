#!/usr/bin/env bash

inputOne=$1

function hello {
  echo $inputOne
  echo "isnotbased"
  echo "whydoesthisnotwork"
}

function nohello {
  echo "check1"
  echo "please stop"
}

hello
nohello

