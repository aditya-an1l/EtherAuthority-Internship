// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Counter {
    uint256 public count;

    event CountIncreased(uint256 newCount);
    event CountDecreased(uint256 newCount);

    function increment() external {
        count += 1;
        emit CountIncreased(count);
    }

    function decrement() external {
        require(count > 0, "Counter: underflow");
        count -= 1;
        emit CountDecreased(count);
    }

    function reset() external {
        count = 0;
    }
}
