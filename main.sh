#!/bin/sh

echo "Serving files on port 8000"
#busybox httpd -f -p 8000
sleep="${SLEEP_SETTING:-10}"
temp="${sleep%\"}"
temp="${temp#\"}"
echo "Sleeping for $temp seconds"
sleep $temp
echo "Done sleeping"