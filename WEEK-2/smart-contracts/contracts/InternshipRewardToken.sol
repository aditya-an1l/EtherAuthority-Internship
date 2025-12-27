// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts (latest stable version)

pragma solidity ^0.8.20;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/**
 * @dev Implementation of the Intern Reward Token (IRT).
 *
 * This contract extends the standard {ERC20} implementation to provide a 
 * specialized token for rewarding interns within the ecosystem. 
 *
 * At construction, the total supply of tokens is minted to the address 
 * that deploys the contract. This follows the "fixed supply" pattern, 
 * although additional minting logic could be added in derived contracts.
 */
contract InternRewardToken is ERC20 {
    /**
     * @dev Sets the values for {name} and {symbol}.
     *
     * Mints a pre-defined initial supply to the caller of the constructor.
     * * NOTE: The decimals are inherited from {ERC20-decimals}, which 
     * defaults to 18. The calculation `10**decimals()` ensures the 
     * total supply is correctly scaled.
     */
    constructor() ERC20("Intern Reward Token", "IRT") {
        // Initial supply: 1,000,000 tokens
        uint256 initialSupply = 1000000 * 10**decimals();
        
        _mint(msg.sender, initialSupply);
    }
}
