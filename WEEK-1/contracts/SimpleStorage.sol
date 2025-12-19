// SPDX-License-Identifier: MIT
// by aditya-an1l

pragma solidity ^0.8.17;

contract SimpleStorage {
    uint256 private value;

    event ValueSet(uint256 newValue);

    function set(uint256 _value) public {
        value = _value;
        emit ValueSet(_value);
    }

    function get() public view returns (uint256) {
        return value;
    }
}
