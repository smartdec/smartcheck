pragma solidity ^0.4.8;//5a1037, 8b1329

contract TestMigrationTarget is StandardToken, UpgradeAgent {//5a1547

    function() public payable {
        throw;
    }

}

pragma solidity ^0.3.8;//5a1037

contract TestMigrationTarget is StandardToken, UpgradeAgent {//5a1547

    function() public payable {
        throw;
    }

}
pragma solidity ^0.4.8;//5a1037

contract TestMigrationTarget is StandardToken, UpgradeAgent {//5a1547

    function() public  {
        throw;
    }

}