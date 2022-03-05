#!/bin/bash
set -eu
CONTAINER_MYSQL=mysql-test
# MYSQL_VERSION=5.7.37
MYSQL_VERSION=8.0.28

COMMANDS="start stop"

do_start() {
	docker rm -f $CONTAINER_MYSQL > /dev/null 2>&1
	docker run -d --name $CONTAINER_MYSQL -e 'MYSQL_ALLOW_EMPTY_PASSWORD=1' mysql:$MYSQL_VERSION
	go run ./ -c $CONTAINER_MYSQL
	echo "***** MYSQL READY! *****"
}

do_stop() {
	docker rm -f $CONTAINER_MYSQL
}

run() {
    for i in $COMMANDS; do
    if [ "$i" == "${1:-}" ]; then
        shift
        do_$i $@
        exit 0
    fi
    done
    echo "USAGE: $( basename $0 ) COMMAND"
    echo "COMMANDS:"
    for i in $COMMANDS; do
    echo "   $i"
    done
    exit 1
}
run $@
