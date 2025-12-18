// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract OwnablePattern is Ownable {
    string public data;

    function setData(string calldata _data) external onlyOwner {
        data = _data;
    }
}
