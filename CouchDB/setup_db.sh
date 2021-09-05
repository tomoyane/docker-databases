#!/bin/bash

while sleep 5; do
  curl -u rob:123456 -X PUT couchdb_01:5984/_users &&  curl -u rob:123456 -X PUT couchdb_01:5984/test
  if [ $? -eq 0 ]; then
    echo "Completed setup CouchDB"
    exit 0
  else
    echo "Setup CouchDB"
  fi
done

