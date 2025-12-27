// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v5.0.0) (token/ERC721/ERC721.sol)

pragma solidity ^0.8.20;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {ERC721URIStorage} from "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import {Counters} from "@openzeppelin/contracts/utils/Counters.sol";

/**
 * @dev Implementation of a Non-Fungible Token (NFT) for Internship Certificates.
 *
 * This contract extends {ERC721} and {ERC721URIStorage} to allow for unique, 
 * individual certificates to be minted with associated metadata (such as 
 * student names, completion dates, and performance metrics) stored off-chain.
 *
 * Each token represents a unique achievement. The contract uses a counter 
 * mechanism to ensure each certificate is assigned a unique, incremental ID.
 */
contract InternshipCertificateNFT is ERC721, ERC721URIStorage {
    using Counters for Counters.Counter;

    // @dev Tracks the ID for the next token to be minted.
    Counters.Counter private _tokenIds;

    /**
     * @dev Initializes the contract by setting a `name` and a `symbol` to the token collection.
     */
    constructor() ERC721("Internship Certificate", "ICNFT") {}

    /**
     * @dev Mints a new certificate NFT to a `recipient`.
     *
     * Custom requirements:
     * - The `tokenURI` should point to a valid JSON metadata file (e.g., on IPFS).
     *
     * Emits a {Transfer} event from the zero address.
     */
    function mintNFT(address recipient, string memory tokenURI) public returns (uint256) {
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        _mint(recipient, newItemId);
        _setTokenURI(newItemId, tokenURI);

        return newItemId;
    }

    /**
     * @dev Internal function to burn a specific token.
     *
     * NOTE: This is an override required by the {ERC721URIStorage} implementation 
     * to ensure that metadata associated with the token is also handled correctly 
     * during the burn process.
     */
    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    /**
     * @dev Returns the Uniform Resource Identifier (URI) for `tokenId` token.
     *
     * Requirements:
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
