// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (latest stable version)

pragma solidity ^0.8.20;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/**
 * @dev Implementation of the Attendance Token (AT).
 *
 * This contract provides a standard {ERC20} token intended to facilitate 
 * attendance tracking and participation incentives. By utilizing the 
 * standard interface, these tokens can be easily integrated into 
 * dashboards or voting mechanisms.
 *
 * The supply mechanism implemented here is a "One-time Mint" where the 
 * total supply is generated upon deployment. This ensures a fixed supply 
 * unless further minting logic is added via an administrative override.
 */
contract AttendanceToken is ERC20 {
    /**
     * @dev Sets the values for {name} and {symbol}.
     *
     * Upon construction, the contract mints a fixed supply of 1,000,000 tokens 
     * to the `msg.sender` (the account that deploys the contract).
     *
     * NOTE: This implementation uses the default value of 18 for {decimals}. 
     * The arithmetic `1,000,000 * 10**decimals()` is used to ensure the 
     * internal balance reflects the intended "human-readable" amount.
     */
    constructor() ERC20("Attendance Token", "AT") {
        // Total supply: 1,000,000 tokens (adjusted for 18 decimals)
        _mint(msg.sender, 1000000 * 10**decimals());
    }
}
