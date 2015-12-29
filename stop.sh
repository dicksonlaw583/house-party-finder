#!/bin/sh

cd .

kill `cat ./tmp/pids/faye.pid`
kill `cat ./tmp/pids/rails.pid`