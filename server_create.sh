#/bin/bash

set -x
set -e

pwd=${PWD}

cd /home/gitosis/repositories

while read line; do
    if [ -z "$line" ]; then
        echo work_dir not exist !!! 1>&2
        continue
    fi
    git init --bare $line.git
    echo ==== $line
    pwd
done
