// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/console.sol";

contract Counter {
    uint256 public counter;

    function get() public view returns (uint256) {
        return counter;
    }

    function inc() public {
        console.log("HERE", counter);
        counter += 1;
        console.log("HERE AFTER INCREMENT", counter);
    }

    function dec() public {
        counter -= 1;
    }
}
