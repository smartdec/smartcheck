pragma solidity ^0.4.0;

contract DeleteExample {

    function f() {
        uint x = data;
        delete x; // sets x to 0, does not affect data
        delete data; // sets data to 0, does not affect x which still holds a copy
        uint[] y = dataArray;
        delete dataArray;
        // <yes> <report> SOLIDITY_DELETE_FOR_ARRAYS 792a6d
        ownersIndex.length = 0;

        for (uint i = proposalIndex.length; i > 0; i--){
                    Proposal storage p = proposals[proposalIndex[i - 1]];
                    proposalIndex[i]=0;
                    if (now > p.createdTimestamp + VOTING_DURATION) {
                        break; // Last active proposal
                    }
        }
    }
}