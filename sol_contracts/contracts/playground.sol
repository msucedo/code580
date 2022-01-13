// SPDX-License-Identifier: MIT

pragma solidity ^0.8.11;

contract C {

	uint public state;
	
	function apply_own(uint _s, uint _tx) public returns(uint) {
		return state = _s + _tx;
	}

	// use smaller-sized uint32 and put together same types
	struct BestPractice {
		uint32 a;
		uint32 b;
		uint c;
	}

	/* visibility and 'this'*/
	uint public data;
	function f() public returns (uint) {
		data = 3;
		return this.data();
	}

	/* return complete array */
	uint[] public numbers = [1,2,3];
	function getAllArray() public view returns(uint[] memory) {
		return numbers;
	}
}	

contract Complex {
	
	struct Data {
		uint a;
		bytes3 b;
		mapping(uint => uint) map;
		uint[3] c;
		uint[] d;
		bytes e;
	}

	mapping(uint => mapping(bool => Data[])) public dataMap;
	mapping(uint => uint) public simpleMap;
	
	function setSimpleMap() public {
		simpleMap[0] = 1;
	}
}
