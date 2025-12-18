// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleStorage {
    uint256 private value;
    event ValueUpdated(uint256 newValue, address indexed updater);

    function store(uint256 newValue) external {
        value = newValue;
        emit ValueUpdated(newValue, msg.sender);
    }

    function retrieve() external view returns (uint256) {
        return value;
    }
}
