// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EtherTransfer {
    event Received(address indexed sender, uint amount);
    event Sent(address indexed to, uint amount);

    // receive and fallback to accept ETH
    receive() external payable {
        emit Received(msg.sender, msg.value);
    }

    fallback() external payable {
        emit Received(msg.sender, msg.value);
    }

    function sendEther(address payable to) external payable {
        require(msg.value > 0, "Must send ETH");
        (bool ok, ) = to.call{value: msg.value}("");
        require(ok, "Transfer failed");
        emit Sent(to, msg.value);
    }

    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}
