// SPDX-License-Identifier: MIT

pragma solidity ^0.8.11;

contract C {

    uint public lastUpdate;

    function updateTime() public {
        lastUpdate = block.timestamp;
    }

    // check if 5 minutes have passed
    function has5minutesPassed() public view returns(bool) {
        return block.timestamp > lastUpdate + 5 minutes;
    }
}