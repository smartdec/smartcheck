# solidity-checker
## Сборка проекта
В корне проекта выполнить mvn clean package

## Анализ файлов
выполнить в папке target 

`java -jar solidity-checker-1.0-SNAPSHOT-jar-with-dependencies.jar -p <путь к директории или к файлу>`

Опциальный параметр: `-r <путь к xml с правилами>`, по умолчанию берутся правила из src\main\resources\rules.xml

Так же это можно сделать через IDE, запустив main-метод `src\main\java\ru\smartdec\soliditycheck\app\cli\Tool.java`

## Просмотр дерева разбора
выполнить команду maven

`mvn exec:java@tree -Dexec.args="-p <путь к файлу>"`

Так же это можно сделать через IDE, запустив main-метод `src\main\java\ru\smartdec\soliditycheck\app\cli\TreeView.java`

## Просмотр дерева разбора в виде XML
выполнить команду maven

`mvn exec:java@xml -Dexec.args="-t <путь к xml> -s <путь к файлу>"`

Так же это можно сделать через IDE, запустив main-метод `src\main\java\ru\smartdec\soliditycheck\app\cli\XmlView.java`