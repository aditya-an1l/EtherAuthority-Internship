// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/**
 * @title MockERC20
 * @author aditya-an1l
 * @notice A simple ERC20 token used for testing staking and reward mechanisms on testnets.
 * @dev This contract allows any user to mint tokens to facilitate easy testing on Sepolia.
 */
contract MockERC20 is ERC20 {
    /**
     * @notice Deploys the contract and sets the Token Name and Symbol.
     * @param name The name of the token (e.g., "Stake Token").
     * @param symbol The symbol of the token (e.g., "STK").
     */
    constructor(string memory name, string memory symbol) ERC20(name, symbol) {
        // Mints an initial supply to the deployer for immediate testing
        _mint(msg.sender, 1000000 * 10**decimals());
    }

    /**
     * @notice Mints new tokens to a specific address.
     * @dev In a production environment, this should be restricted (e.g., onlyOwner).
     * @param to The address that will receive the minted tokens.
     * @param amount The quantity of tokens to mint (including decimals).
     */
    function mint(address to, uint256 amount) external {
        _mint(to, amount);
    }
}
