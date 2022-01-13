// SPDX-License-Identifier: MIT

pragma solidity ^0.8.11;

contract C {

    function minimalScooping() public pure {
        {
            uint num;
            num = 1;
        }

        {
            uint num;
            num = 2;
        }
    }
}