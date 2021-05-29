#!/bin/bash

# Script was used on HTB machine "Oopsie" which is a very easy machine that
# required enumerating all account IDs to find the superadmin account. I used
# this script with mitmproxy to filter out by response body.

##############################################################################
# Script name: ffuf_number_inc.sh
# Description: Generate a wordlist from incremental numbers
# Author:      Marco Lumia
# Email:       lumiamarco@gmail.com
############################################################################## 
#
# Usage example:
# Test parameter values from a generated list of iterated numbers from 1-1000
# for https://example.org/account?id=FUZZ
#
# ./ffuf_number_inc.sh 1-1000 | ffuf -w - -u https://example.org/account?id=FUZZ
#
##############################################################################

if [ $# -eq 0 ]; then
    printf "Usage: %s 1-1000\n" "$0" >&2
    exit 1
fi

IFS="-"

read -ra arr <<< "$1"

START="${arr[0]}"
END="${arr[1]}"

printf "\nGenerating incremented number strings from %s to %s.\n" "$START" "$END" >&2

i="$START"
while [ $i -lt $END ]
do
        printf "%s\n" "$i"
        ((i=i+1))
done
