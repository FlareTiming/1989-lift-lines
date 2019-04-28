#!/bin/bash

mkdir json
mkdir json/comp-input
curl -X GET -H "Accept:application/json" http://localhost:3000/comp-input/comps | jq > json/comp-input/comps.json
curl -X GET -H "Accept:application/json" http://localhost:3000/comp-input/nominals | jq > json/comp-input/nominals.json
curl -X GET -H "Accept:application/json" http://localhost:3000/comp-input/pilots | jq > json/comp-input/pilots.json
curl -X GET -H "Accept:application/json" http://localhost:3000/comp-input/tasks | jq > json/comp-input/tasks.json

mkdir json/task-length
curl -X GET -H "Accept:application/json" http://localhost:3000/task-length/task-lengths | jq > json/task-length/task-lengths.json

curl -X GET -H "Accept:application/json" http://localhost:3000/gap-point/allocation | jq > json/gap-point/allocation.json
curl -X GET -H "Accept:application/json" http://localhost:3000/gap-point/validity | jq > json/gap-point/validity.json
curl -X GET -H "Accept:application/json" http://localhost:3000/gap-point/pilots-status | jq > json/gap-point/pilots-status.json

for t in {1..18}
    do
        mkdir json/comp-input/$t
        curl -X GET -H "Accept:application/json" http://localhost:3000/comp-input/$t/pilot-abs | jq > json/comp-input/$t/pilot-abs.json
        curl -X GET -H "Accept:application/json" http://localhost:3000/comp-input/$t/pilot-dfnt | jq > json/comp-input/$t/pilot-dfnt.json
        curl -X GET -H "Accept:application/json" http://localhost:3000/comp-input/$t/pilot-dnf | jq > json/comp-input/$t/pilot-dnf.json

        mkdir json/task-length/$t
        curl -X GET -H "Accept:application/json" http://localhost:3000/task-length/$t/spherical-edge | jq > json/task-length/$t/spherical-edge.json
        curl -X GET -H "Accept:application/json" http://localhost:3000/task-length/$t/ellipsoid-edge | jq > json/task-length/$t/ellipsoid-edge.json
        curl -X GET -H "Accept:application/json" http://localhost:3000/task-length/$t/projected-edge-spherical | jq > json/task-length/$t/projected-edge-spherical.json
        curl -X GET -H "Accept:application/json" http://localhost:3000/task-length/$t/projected-edge-ellipsoid | jq > json/task-length/$t/projected-edge-ellipsoid.json
        curl -X GET -H "Accept:application/json" http://localhost:3000/task-length/$t/projected-edge-planar | jq > json/task-length/$t/projected-edge-planar.json
    done
