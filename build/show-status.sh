#!/bin/sh

cd "$(dirname "$0")"

rm build_status.png
eips -c
eips -c

if wget http://server/path/to/build_status.png; then
	eips -g build_status.png
else
	eips -g status_error.png
fi
