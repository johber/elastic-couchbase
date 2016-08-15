#!/bin/bash

wait_for_start() {
    "$@"
    while [ $? -ne 0 ]
    do
        echo 'waiting for elastic to start'
        sleep 1
        "$@"
    done
}

create_data_index() {
    curl -X PUT http://localhost:9200/data
}

echo "launch elastic"
/elasticsearch/bin/elasticsearch &
cd /elasticsearch

if [ "$INIT_CLUSTER" = "1" ]; then
    echo "create data index"
    wait_for_start create_data_index
fi
    
wait





