// SPDX-License-Identifier: MIT

pragma solidity ^0.8.11;

contract Owned {

    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    modifier onlyOwner() {
        require(msg.sender == owner,
        "only owner can call this function."
        );
        _; // here the calling fuction code will execute
    }
}

contract destructible is Owned {
    
    function destroyMe() public onlyOwner {
        selfdestruct(owner);
    }
}

contract Letter is Owned {

    string private letter = "a";

    function sell() public onlyOwner {
        letter = "";
    }

    function setLetter(string memory _newLetter) public onlyOwner {
        letter = _newLetter;
    }

    function getLetter() public view returns(string memory) {
        return letter;
    }
}

contract priced {
    // modifier with argument
    modifier costs(uint price) {
        if (msg.value >= price) {
            _;
        }
    }
}

// adds two modifiers
contract Register is priced, destructible {
    mapping(address => bool) public registerAddresses;
    uint price;

    constructor(uint initialPrice) {
        price = initialPrice;
    }

    // using modifier to validate sender sent enough coins
    function register() public payable costs(price) {
        registerAddresses[msg.sender] = true;
    }

    // using modifier to validate sender is the owner
    function updatePrice(uint _newPrice) public onlyOwner returns(uint) {
        price = _newPrice;
        return price;
    }
}

contract Mutex {

    bool locked;
}