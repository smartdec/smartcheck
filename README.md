# solidity-checker
## Version
This version of SmartCheck accompanies the original academic paper "SmartCheck: Static Analysis of Ethereum Smart Contracts"<!--  (LINK) as released (DATE) -->. [The online tool](https://tool.smartdec.net/) uses the actual version of SmartCheck.

## Building the project
Execute in the project directory:

`mvn clean package`

## Start analysis
Execute in the `target` folder: 

`java -jar solidity-checker-1.0-SNAPSHOT-jar-with-dependencies.jar -p <path to directory or file>`

Optional parameter: `-r <path to .xml-file with rules>`; by default the file at `src\main\resources\rules.xml` is used.

Analysis can also be started from an IDE by executing the `main` method of `src\main\java\ru\smartdec\soliditycheck\app\cli\Tool.java`.

## View the parse tree in a graphical form

`mvn exec:java@tree -Dexec.args="-p <path to the file>"`

It can also be done from an IDE by executing the `main` method of `src\main\java\ru\smartdec\soliditycheck\app\cli\TreeView.java`

## View the parse tree as XML

`mvn exec:java@xml -Dexec.args="-t <path to save xml-tree> -s <path to the file>"`

It can also be done from an IDE by executing the `main` method of `src\main\java\ru\smartdec\soliditycheck\app\cli\XmlView.java`