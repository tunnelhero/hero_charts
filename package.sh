#!/usr/bin/env bash

ME=$(basename "$0")

usage() {
	echo "Usage: $ME" >&2
	exit 1

}

helm package webservice
helm package launcher
helm package web

helm servecm --storage local --chart-url https://raw.githubusercontent.com/tunnelhero/hero_charts/master --storage-local-rootdir ./ &

sleep 1

ps ax | grep c[h]artmuseum | awk '{print $1}' | xargs kill

in_file=index-cache.yaml
out_file=index.yaml

# # cat $in_file | sed 's#http://127.0.0.1:8879#https://raw.githubusercontent.com/tunnelhero/hero_charts/master#g' >$out_file

mv $in_file $out_file
