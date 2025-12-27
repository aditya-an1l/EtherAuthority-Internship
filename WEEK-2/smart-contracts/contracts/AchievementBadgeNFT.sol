// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (latest stable version)

pragma solidity ^0.8.20;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {ERC721URIStorage} from "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import {Counters} from "@openzeppelin/contracts/utils/Counters.sol";

/**
 * @dev Implementation of the {IERC721} interface for Achievement Badges.
 *
 * This contract allows for the issuance of non-fungible badges to recognize 
 * specific milestones or achievements. It leverages {ERC721URIStorage} to 
 * associate each unique badge with a distinct metadata profile (e.g., badge 
 * rarity, description, and image assets).
 *
 * Use of the {Counters} library ensures that token IDs are incremented 
 * safely and uniquely for every new badge issued.
 */
contract AchievementBadgeNFT is ERC721, ERC721URIStorage {
    using Counters for Counters.Counter;

    // @dev Tracks the unique identifier for the next badge to be issued.
    Counters.Counter private _tokenIds;

    /**
     * @dev Initializes the contract by setting the collection name and symbol.
     */
    constructor() ERC721("Achievement Badge", "ABNFT") {}

    /**
     * @dev Mints a new achievement badge to a specific `recipient`.
     *
     * Requirements:
     *
     * - `recipient` must be a valid non-zero address.
     * - `tokenURI` must point to the badge's metadata (JSON).
     *
     * Returns the unique `uint256` ID assigned to the new badge.
     */
    function mintNFT(address recipient, string memory tokenURI) public returns (uint256) {
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        _mint(recipient, newItemId);
        _setTokenURI(newItemId, tokenURI);

        return newItemId;
    }

    /**
     * @dev Destroys the badge with `tokenId`.
     *
     * NOTE: This override is mandatory because both {ERC721} and 
     * {ERC721URIStorage} define their own internal burn logic. Calling 
     * `super` ensures the metadata is cleaned up alongside the token record.
     */
    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    /**
     * @dev Returns the metadata URI for a given `tokenId`.
     *
     * Requirements:
     *
     * - `tokenId` must have been minted and not burned.
     */
    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }
}
