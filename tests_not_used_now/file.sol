pragma solidity ^0.4.8;

contract AccessManager {
    address public server; // Address, which the platform website uses.
    address public guardian; // Address of the guardian, who confirms actions.
    address public populous; // Address of the Populous bank contract.

    function AccessManager(address _server, address _guardian) {
        server = _server;
        guardian = _guardian;
    }

    function isServer(address sender) public constant returns (bool) {
        return sender == server;
    }

    function isGuardian(address sender) public constant returns (bool) {
        return sender == guardian;
    }

    function isPopulous(address sender) public constant returns (bool) {
        return sender == populous;
    }

    function changeServer(address _server) {
        if (isGuardian(msg.sender) == false) { throw; }
        server = _server;
    }

    function changeGuardian(address _guardian) {
        if (isGuardian(msg.sender) == false) { throw; }
        guardian = _guardian;
    }

    function changePopulous(address _populous) {
        if (isGuardian(msg.sender) == false) { throw; }
        populous = _populous;
    }
}