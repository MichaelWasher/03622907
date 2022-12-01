#!/bin/bash 

SECS=$1
ROUTE=$2

if [ -z $1 ] ; then 
  echo "Please provide the Route when executing the script."
  echo "./curl_script.sh <seconds> <route>"
  exit 1
else 
  echo "Performing curl requests at '${ROUTE}'"
fi

function curl_output {
	curl -I "${ROUTE}/get" 2>/dev/null | grep HTTP | sed -e "s/^/$(date "+%T") /;"
}

# Perform the call command on the Route endpoint
for (( c=1 ; c <= $SECS; c++ )); do 
  echo "Performing curls for $c"
  for i in {0..50}; do
    curl_output `date "+%T"` &
  done ; wait
  sleep 1
done

