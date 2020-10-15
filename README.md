# SmartCheck

SmartCheck is an extensible static analysis tool for discovering vulnerabilities and other code issues
in Ethereum smart contracts written in the Solidity programming language.

SmartCheck is described in the academic paper titled
["SmartCheck: Static Analysis of Ethereum Smart Contracts"](https://hdl.handle.net/10993/35862)
as released on May 27, 2018.

An online version of SmartCheck is available on [our website](https://tool.smartdec.net/).
## Using NPM package
### Install SmartCheck globally
To install SmartCheck globally to your system run (administrative rights required)
```bash
npm install @smartdec/smartcheck -g
```
### (Optional) Add SmartCheck as development dependency
To add and install SmartCheck as development dependency to your npm project run:
```bash
npm install --save-dev @smartdec/smartcheck
```

### Start the analysis
To start analysis simply run:
```bash
smartcheck -p .
```
Required argument: `-p <path to directory or file>`.
Optional argument: `-r <path to .xml-file with rules>`; by default it uses the built-in rules files.

## Using source code of SmartCheck

### Building the project
The project uses Maven. To build it, execute in the project directory:

```bash
$ mvn clean package
```

### Start the analysis

```bash
$ java -jar target/smartcheck-2.0-SNAPSHOT-jar-with-dependencies.jar -p <path to directory or file>
```

Optional argument: `-r <path to .xml-file with rules>`; by default it uses the built-in rules files.

Analysis can also be started from an IDE by running the `ru.smartdec.smartcheck.app.cli.Tool.main()` method.

## Advanced
### View the parse tree in a graphical form

```bash
$ mvn exec:java@tree -Dexec.args="-p <path to the file>"
```

It can also be done from an IDE by running the `ru.smartdec.smartcheck.app.cli.TreeView.main()` method.

### View the parse tree as XML

```bash
$ mvn exec:java@xml -Dexec.args="-t <path to save xml-tree> -s <path to the file>"
```

It can also be done from an IDE by running the `ru.smartdec.smartcheck.app.cli.XmlView.main()` method.


