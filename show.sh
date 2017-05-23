#!/bin/sh
MODE=$1
RULE=$2
RULE_PATH="./rules/tests/"$RULE"/"
SOL_FILE=$RULE_PATH$RULE".sol"
XML_FILE=$RULE_PATH$RULE".xml"
    
if [ "$MODE" = "tree" ]; then
    mvn exec:java@tree -Dexec.args="-p "$SOL_FILE
elif [ "$MODE" = "xml" ]; then
    mvn exec:java@xml -Dexec.args="-s "$SOL_FILE" -t "$XML_FILE
fi
