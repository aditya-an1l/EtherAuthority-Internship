// SPDX-License-Identifier: MIT
// by aditya-an1l

pragma solidity ^0.8.17;

import "@openzeppelin/contracts/access/Ownable.sol";

contract OwnableExample is Ownable {
    string public secret;

    constructor(address initialOwner) Ownable(initialOwner) {}

    function setSecret(string calldata _secret) external onlyOwner {
        secret = _secret;
    }
}
