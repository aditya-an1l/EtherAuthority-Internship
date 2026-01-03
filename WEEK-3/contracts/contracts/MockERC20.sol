// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/**
 * @title MockERC20 Token
 * @author aditya-an1l
 * @notice This contract provides a basic ERC20 token implementation for testing purposes.
 * @dev Inherits from OpenZeppelin's ERC20. Note that the mint function is public 
 * without access control, making this suitable ONLY for testnets like Sepolia.
 */
contract MockERC20 is ERC20 {

    /**
     * @notice Initializes the contract by setting a name and a symbol, and mints initial supply.
     * @dev The constructor calls the internal _mint function of the ERC20 parent contract.
     * @param name The descriptive name of the token (e.g., "Mock DAI").
     * @param symbol The short-form ticker of the token (e.g., "mDAI").
     */
    constructor(string memory name, string memory symbol) ERC20(name, symbol) {
        /* * Mints 1,000,000 tokens to the deployer. 
         * decimals() is typically 18 for ERC20.
         */
        _mint(msg.sender, 1000000 * 10**decimals());
    }

    /**
     * @notice Creates `amount` new tokens and assigns them to `to`.
     * @dev This is an external wrapper for the internal `_mint` function. 
     * WARNING: This function has no access control and should not be used in production.
     * @param to The account address that will receive the newly created tokens.
     * @param amount The number of tokens to be minted, specified in wei-units.
     */
    function mint(address to, uint256 amount) external {
        _mint(to, amount);
    }
}
