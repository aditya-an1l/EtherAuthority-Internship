// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AccountOwnership {
    mapping(address => address) public ownerOf; // account => owner

    event OwnershipAssigned(address indexed account, address owner);

    function assignOwnership(address account) external {
        ownerOf[account] = msg.sender;
        emit OwnershipAssigned(account, msg.sender);
    }

    function getOwner(address account) external view returns (address) {
        return ownerOf[account];
    }
}
