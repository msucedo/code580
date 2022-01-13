// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.11;

contract SimpleStorage {
    uint favoriteNumber;

    People[] public people;

    mapping(string => uint) favoriteNumbers;

    struct People {
        uint favoriteNumber;
        string name;
    }

    function store(uint _number) public {
        favoriteNumber = _number;
    }

    function get() public view returns(uint) {
        return favoriteNumber;
    }

    function addPerson(string memory _name, uint _favNumber) public {
        people.push(People(_favNumber, _name));
        favoriteNumbers[_name] = _favNumber;
    }
}