// SPDX-License-Identifier: MIT

pragma solidity ^0.8.11;

contract VendingMachine {
	address owner;
	error Unauthorized();
	
	function buy(uint amount) public payable {
		if (amount > msg.value / 2 ether)
			revert("Not enough Ether provided.");
		require(amount <= msg.value / 2 ether, "Not enough Ether provided.");
	}
	
	function withdrawn() public {
		if (msg.sender != owner)
			revert Unauthorized();
		
		payable(msg.sender).transfer(address(this).balance);
	}	
}
