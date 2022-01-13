// SPDX-License-Identifier: MIT

pragma solidity ^0.8.11;

contract Ownable {
    
    address public _owner;

    event OwnershipTransferred(
        address indexed previousOwner,
        address indexed newOwner
    );

    constructor() {
        _owner = msg.sender;
        emit OwnershipTransferred(address(0), _owner);
    }

    function owner() public view returns(address) {
        return _owner;
    }

    modifier onlyOwner() {
        require(isOwner(), "error bro.");
        _;
    }

    function isOwner() public view returns(bool) {
        return msg.sender == _owner;
    }

    function transferOwnership(address _newOwner) public {
        _transferOwnership(_newOwner);
    }

    function _transferOwnership(address _newOwner) internal onlyOwner {
        require(_newOwner != address(0));
        emit OwnershipTransferred(_owner, _newOwner);
        _owner = _newOwner;
    }
}