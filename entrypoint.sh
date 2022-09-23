#!/bin/bash

COLOR_RED='\033[0;31m'
COLOR_GREEN='\033[0;32m'
COLOR_YELLOW='\033[1;33m'
COLOR_OFF='\033[0m'

REQS=${GITHUB_WORKSPACE}/${DEP_PATH}

echo -e "\n----------------- Variables -------------------"
echo -e "${COLOR_YELLOW}INFO${COLOR_OFF} Requirements path: ${REQS}"

echo -e "\n------------ Install requirements -------------"
pip install -r $REQS

echo -e "\n-------------- Do license check ---------------"
echo -e "${COLOR_YELLOW}INFO${COLOR_OFF} Call command: liccheck -r ${REQS} &> output.txt"
liccheck -r $REQS &> output.txt
EXIT_CODE=$?

echo -e "\n-------- Python License Check results ---------"
echo -e "${COLOR_YELLOW}INFO${COLOR_OFF} Call command: cat output.txt"
cat output.txt

if [ "$EXIT_CODE" -eq 0 ]
then
    echo -e "\n${COLOR_GREEN}SUCCESS${COLOR_OFF}"
    exit 0
else
    echo -e "\n${COLOR_RED}ERROR${COLOR_OFF} exit ${EXIT_CODE}"
    exit 1
fi