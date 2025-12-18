// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HelloWorld {
    string public message;

    constructor(string memory _message) {
        message = _message;
    }

    function setMessage(string calldata _message) external {
        message = _message;
    }

    function hello() external view returns (string memory) {
        return message;
    }
}
