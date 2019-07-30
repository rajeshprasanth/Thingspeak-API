#!/bin/bash
#
# Created on Mon Jul 29 23:22:08 IST 2019
#
#-----------------------------------------------------------------------------------------
#
export job=$1
export job_dir=$2
export input_file=$3
export output_file=$4
export error_file=$5
#
cat > submit_gist.json << EOF
{
  "title": "$job aborted||Job_Dir: $job_dir",
  "body": "Job :: $job <br>Job Directory :: $job_dir</br> ",
  "labels": ["bug"]
}
EOF

curl --user rajeshprasanth:0ddcddf6d932a7aef0abfe786a31010b8028bdb0  -X POST -H "Accept: application/vnd.github.v3+json" -H "Content-Type: application/json" https://api.github.com/repos/rajeshprasanth/Thingspeak-API/issues --data @submit_issue.json

