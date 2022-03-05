# mysql-docker-wait-initalize

This program waits for initialization of [MySQL Docker official image](https://hub.docker.com/_/mysql). It has been tested on mysql:5.7.37 and mysql:8.0.28.

[MySQL Docker official image](https://hub.docker.com/_/mysql) の初期化を待機するプログラムです。mysql:5.7.37 と mysql:8.0.28 で動作確認しています。

# USAGE

	$ bash << 'EOS'
	docker run -d --name mysql-test -e 'MYSQL_RANDOM_ROOT_PASSWORD=1' mysql:5.7.37
	dist/mysql-up-wait-darwin-amd64 -c mysql-test
	echo "*********** SERVER IS READY! ***********"
	docker rm -f mysql-test
	EOS

# BUILD

	$ make

# Lisence

MIT
