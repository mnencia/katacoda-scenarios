#!/bin/bash

GREEN='\033[1;32m'
NC='\033[0m'

clear

echo -e "${GREEN}Please wait while the environment is setup. It may take up to 5 minutes."
echo -e ""
echo -e ""
echo -ne "Setting up Environment ..."

until grep -i "done" /opt/katacoda-finished &> /dev/null
do
    printf '.'
    sleep 1
done

while [[ $(kubectl get pods -A -o 'jsonpath={..status.conditions[?(@.type=="Ready")].status}') =~ 'False' ]]
do
    printf '.'
    sleep 1
done

clear

echo -e "Welcome to your 4 Node (already installed) Kubernetes Lab.${NC}\r\n"

rm -f /tmp/k8s-ready.sh
