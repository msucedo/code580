// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract WavePortal {

	uint256 totalWaves;

	constructor() {
		console.log("yo yo, I'm a contract I'm smart");
	}

	function wave() public {
		totalWaves += 1;
		console.log("someone waved: " %s, msg.sender);
	}

	function getTotalWaves() public view returns(uint) {
		return totalWaves;
	}
}
