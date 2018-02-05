# solidity-checker
## Version
This version of SmartCheck accompanies the original academic paper<!--  (LINK) as released (DATE) -->. The actual version of SmartCheck is used in tool.smartdec.net.

## Building the project
Execute in the project directory:

`mvn clean package`

## Start analysis
Execute in `target` folder: 

`java -jar solidity-checker-1.0-SNAPSHOT-jar-with-dependencies.jar -p <path to directory or file>`

Optional parameter: `-r <path to .xml-file with rules>`; by default it is src\main\resources\rules.xml

It can also be done via IDE by executing main-method `src\main\java\ru\smartdec\soliditycheck\app\cli\Tool.java`

## View parse tree
Execute maven command:

`mvn exec:java@tree -Dexec.args="-p <path to the file>"`

It can also be done via IDE by executing main-method `src\main\java\ru\smartdec\soliditycheck\app\cli\TreeView.java`

## View parse tree in XML-form
Execute maven command:

`mvn exec:java@xml -Dexec.args="-t <path to save xml-tree> -s <path to the file>"`

It can also be done via IDE by executing main-method `src\main\java\ru\smartdec\soliditycheck\app\cli\XmlView.java`