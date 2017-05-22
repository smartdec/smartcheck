#!/bin/sh
RULES_DIR="./rules"
xmllint --noout --schema $RULES_DIR/rules.xsd $RULES_DIR/rules.xml 
java -jar ./target/solidity-checker-1.0-SNAPSHOT-jar-with-dependencies.jar -p $RULES_DIR/tests -r $RULES_DIR/rules.xml > results.txt
