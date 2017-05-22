#!/bin/sh
RULES_DIR="./rules"
RULE=$1
mvn exec:java@tree -Dexec.args="-p "$RULES_DIR"/tests/"$RULE"/"$RULE".sol"
