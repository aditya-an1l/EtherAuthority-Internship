// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (latest stable)

pragma solidity ^0.8.20;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {ERC721URIStorage} from "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import {Counters} from "@openzeppelin/contracts/utils/Counters.sol";

/**
 * @dev Implementation of the {IERC721} interface for Course Completion Certificates.
 *
 * This contract provides a mechanism to issue unique non-fungible tokens representing 
 * the successful completion of educational courses. It utilizes {ERC721URIStorage} 
 * to allow each certificate to point to unique off-chain metadata (e.g., student name, 
 * grade, and course details).
 *
 * The contract uses an internal counter to ensure that each minted certificate 
 * receives a unique, incremental `tokenId`.
 */
contract CourseCompletionNFT is ERC721, ERC721URIStorage {
    using Counters for Counters.Counter;

    // @dev Counter used to track the total number of issued certificates and assign IDs.
    Counters.Counter private _tokenIds;

    /**
     * @dev Sets the values for {name} and {symbol}.
     *
     * These values are immutable: they can only be set once during construction.
     */
    constructor() ERC721("Course Completion", "CCNFT") {}

    /**
     * @dev Mints a new certificate to a `recipient`.
     *
     * Requirements:
     *
     * - `recipient` cannot be the zero address.
     * - `tokenURI` should be a valid link to the certificate metadata.
     *
     * Returns the `newItemId` of the newly minted certificate.
     */
    function mintNFT(address recipient, string memory tokenURI) public returns (uint256) {
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        _mint(recipient, newItemId);
        _setTokenURI(newItemId, tokenURI);

        return newItemId;
    }

    /**
     * @dev Destroys `tokenId`. 
     *
     * NOTE: This override is required to reconcile the internal burn logic of 
     * {ERC721} and {ERC721URIStorage}, ensuring metadata is properly cleared.
     */
    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    /**
     * @dev See {IERC721Metadata-tokenURI}.
     *
     * Requirements:
     *
     * - `tokenId` must exist.
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
