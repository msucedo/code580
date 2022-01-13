// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

import "@chainlink/contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";

contract FoundMe {
    
    mapping(address => uint) public addressToAmountFunded;

    // payable function
    function fund() public payable {
        addressToAmountFunded[msg.sender] += msg.value;
    }
}