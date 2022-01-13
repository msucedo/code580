 // SPDX-License-Identifier: GPL-3.0

 pragma solidity 0.8.11;

 contract SimpleStorage {
    
    uint storedData;
    
    function set(uint _newData) public {
        storedData = _newData;
    }

    function get() public view returns (uint) {
        return storedData;
    }
 }