#!/bin/bash

set -e

provisionedIn=$1

if [[ -n "$provisionedIn" ]]; then
    if [[ "$provisionedIn" = "azure" ]]; then
        # Refresh Enterprise SuSe License for Azure Server
        echo "Starting: Refreshing Enterprise SuSe License for Azure Server"
        sudo /usr/sbin/registercloudguest --force-new
        echo "Finished: Refreshing Enterprise SuSe License for Azure Server"
    elif [[ "$provisionedIn" = "onpremise" ]]; then
        # Refresh Enterprise SuSe License for onpremise Server
        echo "Starting: Refreshing Enterprise SuSe License for On-premise Server"
        echo "ERROR: NOT IMPLEMENTED"
        echo "Finished: Refreshing Enterprise SuSe License for On-Premise Server"
    else
        echo "ERROR: Invalid argument supplied"
    fi
else
    echo "ERROR: Argument not supplied"
fi
