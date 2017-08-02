pragma solidity ^0.4.11;//1a1832

contract SolidityStyleGuideViolation {
    function refundAll1() public {
        while ( x > refundAddresses.length) { //2a1347

            }
        }
    function refundAll1() public {
        while ( x < refundAddresses.length) {//2a1347

            }
        }
    function refundAll1() public {
        while (refundAddresses.length <x < refundAddresses.length) { //2a1347

            }
        }
    function refundAll1() public {
        while (refundAddresses.length<x < 3) { //2a1347
        }
    }
    function refundAll1() public {
        while (3<x < 3) {

        }
    }
}