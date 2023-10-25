#!/bin/sh -l

API_URL="$1"
API_KEY="$2"

HTTP_STATUS=$(curl -s -o /tmp/katana-ci-rsp.txt -w "%{http_code}" -H "Authorization: Bearer $API_KEY" "${API_URL}/start")
if [ $HTTP_STATUS -eq 200 ]; then
    KATANA_CI_NAME=$(cat /tmp/katana-ci-rsp.txt)
    echo "KATANA_CI_NAME=${KATANA_CI_NAME}" >> $GITHUB_ENV
else
    echo "HTTP request returned status code ${HTTP_STATUS}, expected 200."
    exit 1
fi

