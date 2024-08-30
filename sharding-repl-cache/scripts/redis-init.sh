#!/bin/bash

docker compose -f ./sharding-repl-cache/compose.yaml exec -T redis1 echo "yes" | redis-cli --cluster create   173.17.0.16:6379   173.17.0.15:6379   173.17.0.14:6379   173.17.0.13:6379   173.17.0.12:6379   173.17.0.11:6379   --cluster-replicas 1
