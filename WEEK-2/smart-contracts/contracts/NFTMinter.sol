// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (standard documentation style)

pragma solidity ^0.8.20;

import {InternshipCertificateNFT} from "./InternshipCertificateNFT.sol";
import {CourseCompletionNFT} from "./CourseCompletionNFT.sol";
import {AchievementBadgeNFT} from "./AchievementBadgeNFT.sol";

/**
 * @dev implementation of a centralized minter hub for educational credentials.
 *
 * This contract coordinates the minting process across three distinct {ERC721} 
 * collections: Internship Certificates, Course Completions, and Achievement Badges.
 *
 * By using this hub, an administrator can manage multiple credential types from 
 * a single interface, rather than interacting with three separate contract addresses 
 * individually.
 */
contract NFTMinter {
    /**
     * @dev External contract instance for Internship Certificates.
     */
    InternshipCertificateNFT public icNft;

    /**
     * @dev External contract instance for Course Completion NFTs.
     */
    CourseCompletionNFT public ccNft;

    /**
     * @dev External contract instance for Achievement Badge NFTs.
     */
    AchievementBadgeNFT public abNft;

    /**
     * @dev Initializes the hub by linking it to the deployed addresses of the 
     * specific NFT contracts.
     *
     * Requirements:
     * - The provided addresses must be valid deployments of their respective contracts.
     */
    constructor(address _icNft, address _ccNft, address _abNft) {
        icNft = InternshipCertificateNFT(_icNft);
        ccNft = CourseCompletionNFT(_ccNft);
        abNft = AchievementBadgeNFT(_abNft);
    }

    /**
     * @dev Triggers the {mintNFT} function on the Internship Certificate contract.
     *
     * Requirements:
     * - This contract (`NFTMinter`) must have the "Minter" role or permission 
     * on the `icNft` contract to execute the call.
     */
    function mintInternshipCert(address recipient, string memory uri) public {
        icNft.mintNFT(recipient, uri);
    }

    /**
     * @dev Triggers the {mintNFT} function on the Course Completion contract.
     *
     * Requirements:
     * - This contract must have permission to mint on the `ccNft` contract.
     */
    function mintCourseCompletion(address recipient, string memory uri) public {
        ccNft.mintNFT(recipient, uri);
    }

    /**
     * @dev Triggers the {mintNFT} function on the Achievement Badge contract.
     *
     * Requirements:
     * - This contract must have permission to mint on the `abNft` contract.
     */
    function mintAchievementBadge(address recipient, string memory uri) public {
        abNft.mintNFT(recipient, uri);
    }
}
