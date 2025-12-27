// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (updated to v5.0 compatibility)

pragma solidity ^0.8.20;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {ERC721URIStorage} from "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

/**
 * @dev Implementation of the {IERC721} interface for Course Completion Certificates.
 *
 * This version removes the deprecated Counters library and updates internal 
 * function overrides for compatibility with OpenZeppelin v5.0+.
 */
contract CourseCompletionNFT is ERC721, ERC721URIStorage {
    // @dev Native uint256 replaces the removed Counters library for gas efficiency.
    uint256 private _nextTokenId;

    /**
     * @dev Sets the values for {name} and {symbol}.
     */
    constructor() ERC721("Course Completion", "CCNFT") {}

    /**
     * @dev Mints a new certificate to a `recipient`.
     *
     * Requirements:
     * - `recipient` cannot be the zero address.
     *
     * Returns the `tokenId` of the newly minted certificate.
     */
    function mintNFT(address recipient, string memory tokenURI) public returns (uint256) {
        uint256 tokenId = _nextTokenId++;

        _safeMint(recipient, tokenId);
        _setTokenURI(tokenId, tokenURI);

        return tokenId;
    }

    /**
     * @dev See {IERC721Metadata-tokenURI}.
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
     * @dev Required override for interface detection.
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