#!/bin/bash

mongo <<EOF
var config = {
    "_id": "dbrs",
    "version": 1,
    "members": [
        {
            "_id": 1,
            "host": "docker.for.mac.localhost:27021",
            "priority": 3
        },
        {
            "_id": 2,
            "host": "docker.for.mac.localhost:27022",
            "priority": 2
        },
        {
            "_id": 3,
            "host": "docker.for.mac.localhost:27023",
            "priority": 1
        }
    ]
};
rs.initiate(config, { force: true });
rs.status();
EOF