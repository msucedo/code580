// SPDX-License-Identifier: MIT

pragma solidity ^0.8.11;

contract Country {

    string name;
    uint population;
    string[] rules;

    mapping(Secretary => string) public secretaries;

    function makeRule(string memory _rule) public {
        rules.push(_rule);
    }

    function addSecretary(string memory _name) public {
        Secretary secretary = new Secretary(_name);
        secretaries[secretary] = _name;
    }
}

contract Secretary {
    
    string name;

    constructor(string memory _name) {
        name = _name;
    }
}