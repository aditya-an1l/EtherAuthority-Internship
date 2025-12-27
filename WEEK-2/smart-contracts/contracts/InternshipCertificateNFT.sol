// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (updated to v5.0 compatibility)

pragma solidity ^0.8.20;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {ERC721URIStorage} from "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

/**
 * @dev Implementation of a Non-Fungible Token (NFT) for Internship Certificates.
 *
 * Updated for OpenZeppelin v5.0+:
 * - Removed deprecated Counters library.
 * - Optimized for native uint256 incrementing.
 */
contract InternshipCertificateNFT is ERC721, ERC721URIStorage {
    // @dev Native uint256 for tracking token IDs (standard in v5.0)
    uint256 private _nextTokenId;

    /**
     * @dev Initializes the contract by setting a `name` and a `symbol`.
     */
    constructor() ERC721("Internship Certificate", "ICNFT") {}

    /**
     * @dev Mints a new certificate NFT to a `recipient`.
     *
     * Requirements:
     * - `_tokenURI` must be a valid link to the metadata JSON.
     *
     * Returns the unique ID assigned to the new certificate.
     */
    function mintNFT(address recipient, string memory _tokenURI) public returns (uint256) {
        uint256 newItemId = _nextTokenId++;

        _safeMint(recipient, newItemId);
        _setTokenURI(newItemId, _tokenURI);

        return newItemId;
    }

    /**
     * @dev Returns the Uniform Resource Identifier (URI) for `tokenId`.
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