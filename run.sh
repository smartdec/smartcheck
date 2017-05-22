#!/bin/sh
RULES_DIR="./rules"
java -jar ./target/solidity-checker-1.0-SNAPSHOT-jar-with-dependencies.jar -p $RULES_DIR/tests -r $RULES_DIR/rules.xml > results.txt
