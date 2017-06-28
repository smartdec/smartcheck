# solidity-checker
Запуск: в корне проекта выполнить mvn clean install, после чего в папке target выполнить:
java -jar solidity-checker-1.0-SNAPSHOT-jar-with-dependencies.jar -p ../rules/tests/ -r ../rules/rules.xml > result.txt 2> err.txt