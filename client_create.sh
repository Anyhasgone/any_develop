#/bin/bash

set -x
set -e

pwd=${PWD}

while read line; do
    line1=${line%%/*}
    if [ -z "$line" ]; then
        echo work_dir not exist !!! 1>&2
        continue
    fi

    if [ $(ls $pwd/$line | wc -l) -eq 0 ]; then
        if [ -e "$pwd/$line/.git" ]; then
			echo this is empty project!!! 1>&2
			workdir=$pwd/$line
			cd $workdir
            rm -fr .git
			git init .  1>&2
			echo "init empty git" > readme.txt
			git add . -f 1>&2
			git commit -m "Initial commit" 1>&2

			if [ "$line1" = "vendor" ]; then
				git push --set-upstream git://192.168.116.238/onething/$line.git master
			elif [ "$line1" = "device" ]; then
				git push --set-upstream git://192.168.116.238/onething/$line.git master
			elif [ "$line1" = "fbc3-release" ]; then
				git push --set-upstream git://192.168.116.238/onething/$line.git master
			elif [ "$line1" = "common" ]; then
				git push --set-upstream git://192.168.116.238/onething/$line.git master
			elif [ "$line1" = "hardware" ]; then
				git push --set-upstream git://192.168.116.238/onething/$line.git master
			elif [ "$line1" = "uboot" ]; then
				git push --set-upstream git://192.168.116.238/onething/$line.git master
			else
				git push --set-upstream git://192.168.116.238/onething/platform/$line.git master
			fi
			cd -
		fi
        continue
    fi

    workdir=$pwd/$line
    echo ==== $workdir
    cd $workdir
    rm -rf .git
    git init .  1>&2
    git add . -f 1>&2
    git commit -m "Initial commit" 1>&2

    if [ "$line1" = "vendor" ]; then
        git push --set-upstream git://192.168.116.238/onething/$line.git master
    elif [ "$line1" = "device" ]; then
        git push --set-upstream git://192.168.116.238/onething/$line.git master
    elif [ "$line1" = "fbc3-release" ]; then
        git push --set-upstream git://192.168.116.238/onething/$line.git master
    elif [ "$line1" = "common" ]; then
        git push --set-upstream git://192.168.116.238/onething/$line.git master
    elif [ "$line1" = "hardware" ]; then
        git push --set-upstream git://192.168.116.238/onething/$line.git master
    elif [ "$line1" = "uboot" ]; then
        git push --set-upstream git://192.168.116.238/onething/$line.git master
    else
        git push --set-upstream git://192.168.116.238/onething/platform/$line.git master
    fi

    cd -
done
