// SPDX-License-Identifier: MIT

pragma solidity 0.8.11;

import "./advanced_uint_storage.sol";

contract StorageFactory {
    
    SimpleStorage[] public allStorages;

    // automatically deploying SimpleStorage contract to the blockchain
    function createStorage() public {
        SimpleStorage simpleStorage = new SimpleStorage();
        allStorages.push(simpleStorage);
    }

    // interact with deployed contract
    function sfStore(uint _contractIdentifier, uint _storeNumber) public {
        // get the chosen contract from the contract's array
        return SimpleStorage(address(allStorages[_contractIdentifier])).store(_storeNumber);
    }

    function sfGet(uint _contractIdentifier) public view returns(uint) {
        return SimpleStorage(address(allStorages[_contractIdentifier])).get();
    }

}