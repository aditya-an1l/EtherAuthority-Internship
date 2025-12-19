// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Counter {
    uint256 public count;

    event CountIncreased(uint256 newCount);

    function increment() public {
        count += 1;
        emit CountIncreased(count);
    }

    function decrement() public {
        require(count > 0, "Counter: underflow");
        count -= 1;
    }

    function reset() public {
        count = 0;
    }
}
