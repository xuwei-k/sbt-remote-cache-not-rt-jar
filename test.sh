#!/bin/bash

set -eux

git clean -fdx

curl -sL https://github.com/shyiko/jabba/raw/7bb317fe378657ac9cdca66a1ebbad90fcd94d5f/install.sh | bash && . ~/.jabba/jabba.sh
jabba install adopt@1.8.0-272
jabba install adopt@1.8.0-265
jabba use adopt@1.8.0-272
java -version

wget https://raw.githubusercontent.com/paulp/sbt-extras/fd84adb2185bca537fe45cc83fdf92e2ae12f8b6/sbt
chmod +x ./sbt
./sbt pushRemoteCache
rm -rf target
jabba use adopt@1.8.0-265
java -version
./sbt pullRemoteCache "set logLevel := Level.Debug" compile
