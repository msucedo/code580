// SPDX-License-Identifier: MIT

pragma solidity ^0.11.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract MyNFT is ERC721 {
	constructor() ERC721("MyNFT", "MNFT") public {
	}
}
