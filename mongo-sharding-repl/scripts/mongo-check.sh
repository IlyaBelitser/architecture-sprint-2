#!/bin/bash

docker compose exec -T mongos_router mongosh --port $27024 <<EOF

sh.addShard( "shard1/shard1-1:27018,shard1-2:27019,shard1-3:27020");
sh.addShard( "shard2/shard2-1:27021,shard2-2:27022,shard2-3:27023");

sh.enableSharding("somedb");
sh.shardCollection("somedb.helloDoc", { "name" : "hashed" } )

use somedb

for(var i = 0; i < 1000; i++) db.helloDoc.insert({age:i, name:"ly"+i})

EOF

docker compose exec -T mongos_router mongosh --port 27024 --quiet <<EOF
use somedb
db.helloDoc.countDocuments()
EOF

docker compose exec -T shard1-1 mongosh --port 27018 --quiet <<EOF
use somedb
db.helloDoc.countDocuments()
EOF

docker compose exec -T shard2-1 mongosh --port 27021 --quiet <<EOF
use somedb
db.helloDoc.countDocuments()
EOF
