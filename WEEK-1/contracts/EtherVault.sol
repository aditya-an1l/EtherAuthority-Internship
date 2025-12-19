// SPDX-License-Identifier: MIT
// by aditya-an1l

pragma solidity ^0.8.17;

contract EtherVault {
    address public owner;

    event Deposited(address indexed sender, uint256 amount);
    event Withdrawn(address indexed to, uint256 amount);

    constructor() {
        owner = msg.sender;
    }

    // allow the contract to receive ETH
    receive() external payable {
        emit Deposited(msg.sender, msg.value);
    }

    function deposit() external payable {
        emit Deposited(msg.sender, msg.value);
    }

    function withdraw(uint256 _amount) external {
        require(msg.sender == owner, "Only owner");
        require(address(this).balance >= _amount, "Insufficient balance");
        payable(owner).transfer(_amount);
        emit Withdrawn(owner, _amount);
    }

    function balance() public view returns (uint256) {
        return address(this).balance;
    }
}
