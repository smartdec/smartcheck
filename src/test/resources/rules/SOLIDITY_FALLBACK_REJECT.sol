pragma solidity ^0.4.8;//a91640

contract TestMigrationTarget is StandardToken, UpgradeAgent {

    function() public payable {
        throw;
    }

}

pragma solidity ^0.3.8;

contract TestMigrationTarget is StandardToken, UpgradeAgent {

    function() public payable {
        throw;
    }

}
pragma solidity ^0.4.8;

contract TestMigrationTarget is StandardToken, UpgradeAgent {

    function() public  {
        throw;
    }

}