// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v5.0.0)

pragma solidity ^0.8.20;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/**
 * @dev Implementation of the Task Completion Token (TCT).
 *
 * This contract provides a standard {ERC20} token intended to reward the 
 * successful completion of specific tasks or milestones within a workflow.
 *
 * The implementation follows a fixed-supply model where the total supply is 
 * generated during the construction phase and assigned to the deployer.
 * To introduce dynamic rewards, a {mint} mechanism should be implemented 
 * in a specialized extension.
 */
contract TaskCompletionToken is ERC20 {
    /**
     * @dev Sets the values for {name} and {symbol}.
     *
     * All 1,000,000 tokens are minted to the account that dispatches the 
     * creation transaction (`msg.sender`).
     *
     * NOTE: The calculation `10**decimals()` is used to account for the 
     * default 18 decimal places, ensuring the "1 million" figure is 
     * represented correctly in the contract's internal arithmetic.
     */
    constructor() ERC20("Task Completion Token", "TCT") {
        uint256 supply = 1000000 * 10**decimals();
        _mint(msg.sender, supply);
    }
}
