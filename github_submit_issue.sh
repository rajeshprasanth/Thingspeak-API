#!/bin/bash
#
# Created on Thu Jul 25 23:14:48 IST 2019
#
export filename=$1

cat > submit_issue.json << EOF
{
  "title": "Quantum Espresso Process failed: $filename",
  "body": "$(cat $filename.out)",
  "labels": ["bug"]
}
EOF

#curl --user rajeshprasanth:0ddcddf6d932a7aef0abfe786a31010b8028bdb0  -X POST -H "Accept: application/vnd.github.v3+json" -H "Content-Type: application/json" https://api.github.com/repos/rajeshprasanth/Thingspeak-API/issues --data @submit_issue.json


curl --user rajeshprasanth:0ddcddf6d932a7aef0abfe786a31010b8028bdb0  -X POST -H "Accept: application/vnd.github.v3+json" -H "Content-Type: application/json" https://api.github.com/gists --data @submit_issue.json

