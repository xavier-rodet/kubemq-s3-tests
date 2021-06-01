#!/bin/bash

# Mount S3
# echo "$SPACE_KEY:$SPACE_TOKEN" >> .passwd-s3fs
# chmod 600 .passwd-s3fs
s3fs $SPACE_NAME store -o passwd_file=.passwd-s3fs -o url=$SPACE_URL -o allow_other -o use_path_request_style -o uid=1001 -o gid=0
# ./kubemq-run