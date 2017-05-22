#!/bin/sh
MODE=$1
RULE=$2
RULE_PATH="./rules/tests/"$RULE"/"
SOL_FILE=$RULE_PATH$RULE".sol"
XML_FILE=$RULE_PATH$RULE".xml"
XML_ARGS="-s "$SOL_FILE" -t "$XML_FILE
    
if [ "$MODE" = "tree" ]; then
    mvn exec:java@tree -Dexec.args="-p "$SOL_FILE
elif [ "$MODE" = "xml" ]; then
    echo $XML_ARGS
    mvn exec:java@xml -Dexec.args=$XML_ARGS
fi
