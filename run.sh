#!/bin/bash

while true; do
  ./777.sh
  sleep 300
  kill $!
done
