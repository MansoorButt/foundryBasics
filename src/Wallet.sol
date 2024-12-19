// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
// Authentication testing with Foundry

contract Wallet {
    address payable public owner;

    constructor() payable {
        owner = payable(msg.sender);
    }

    receive() external payable {}

    function withdraw(uint256 _amount) external {
        require(msg.sender == owner, "Caller is not an owner");
        payable(msg.sender).transfer(_amount);
    }

    function setOwner(address _owner) external {
        require(msg.sender == owner, "Caller is not an Owner");
        owner = payable(_owner);
    }
}
