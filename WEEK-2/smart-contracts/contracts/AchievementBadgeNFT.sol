// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (updated to v5.0 formatting)

pragma solidity ^0.8.20;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {ERC721URIStorage} from "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

/**
 * @dev Implementation of the {IERC721} interface for Achievement Badges.
 *
 * This version is optimized for OpenZeppelin v5.0+, removing the deprecated 
 * Counters library in favor of native uint256 incrementing.
 */
contract AchievementBadgeNFT is ERC721, ERC721URIStorage {
    // @dev Tracks the ID for the next badge to be issued.
    uint256 private _nextTokenId;

    /**
     * @dev Initializes the contract by setting the collection name and symbol.
     */
    constructor() ERC721("Achievement Badge", "ABNFT") {}

    /**
     * @dev Mints a new achievement badge to a specific `recipient`.
     *
     * Requirements:
     * - `recipient` must be a valid non-zero address.
     * - `tokenURI` must point to the badge's metadata.
     */
    function mintNFT(address recipient, string memory tokenURI) public returns (uint256) {
        uint256 tokenId = _nextTokenId++;

        _safeMint(recipient, tokenId);
        _setTokenURI(tokenId, tokenURI);

        return tokenId;
    }

    /**
     * @dev Returns the metadata URI for a given `tokenId`.
     *
     * Requirements:
     * - `tokenId` must exist.
     *
     * NOTE: This override is required because both {ERC721} and 
     * {ERC721URIStorage} implement this function.
     */
    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return super.tokenURI(tokenId);
    }

    /**
     * @dev Returns true if this contract implements the interface defined by
     * `interfaceId`. See {IERC165-supportsInterface}.
     */
    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}