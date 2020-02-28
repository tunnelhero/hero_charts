#!/usr/bin/env bash

ME=$(basename "$0")

usage() {
	echo "Usage: $ME" >&2
	exit 1

}

helm package webservice
helm package launcher
helm package web

helm repo index ./ --url https://raw.githubusercontent.com/tunnelhero/hero_charts/master
