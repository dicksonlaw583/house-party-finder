#!/bin/sh

cd .

rackup faye.ru -s thin -E production -D -P ./tmp/pids/faye.pid
thin start -e production -d -P ./tmp/pids/rails.pid
sleep 5