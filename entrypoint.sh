#!/bin/sh -l

API_URL="$1"
API_KEY="$2"
CMD="$3"
NAME="$4"

if [ "${CMD}" == "start" ]; then

    HTTP_STATUS=$(curl --write-out "%{http_code}" --output /tmp/katana-ci-rsp.txt  -H "Authorization: Bearer ${API_KEY}" "${API_URL}/start")

    if [ $HTTP_STATUS -eq 200 ]; then
        RSP_NAME=$(cat /tmp/katana-ci-rsp.txt)
        echo "katana-name=${RSP_NAME}" >> $GITHUB_OUTPUT
        echo "katana-rpc=${API_URL}/${RSP_NAME}/katana" >> $GITHUB_OUTPUT
    else
        echo "HTTP request returned status code ${HTTP_STATUS}, expected 200."
        exit 1
    fi

else
    curl -H "Authorization: Bearer ${API_KEY}" "${API_URL}/${NAME}/stop"
fi
