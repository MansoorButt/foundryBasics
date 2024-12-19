// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Wallet} from "../src/Wallet.sol";

contract AuthTest is Test {
    Wallet public wallet;

    function setUp() public {
        wallet = new Wallet();
    }

    function testSetOwner() public {
        console.log("Wallet Owner", wallet.owner());
        wallet.setOwner(address(1));
        assertEq(wallet.owner(), address(1));
    }

    function testFailNotOwner() public {
        vm.prank(address(1)); // now we will be calling the function as address(1)
        wallet.setOwner(address(2));
    }
 
    function testFailSetOwnerAgain() public {
        wallet.setOwner(address(1));

        vm.startPrank(address(1)); // This line ensures everycall is made from address(1) below it
        wallet.setOwner(address(2));
        wallet.setOwner(address(3));
        wallet.setOwner(address(4));

        vm.stopPrank(); // This line ends us from Masquerading as address(1) and returns the msg.sender === address(this)

        wallet.setOwner(address(1));
    }
}
