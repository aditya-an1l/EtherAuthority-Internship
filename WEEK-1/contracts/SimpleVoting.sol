// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleVoting {
    struct Proposal { string name; uint voteCount; }
    mapping(uint => Proposal) public proposals;
    uint public proposalCount;
    mapping(address => bool) public voted;

    event ProposalAdded(uint indexed id, string name);
    event Voted(address indexed voter, uint indexed proposalId);

    function addProposal(string calldata name) external {
        proposals[proposalCount] = Proposal(name, 0);
        emit ProposalAdded(proposalCount, name);
        proposalCount++;
    }

    function vote(uint proposalId) external {
        require(!voted[msg.sender], "Already voted");
        require(proposalId < proposalCount, "Invalid proposal");
        proposals[proposalId].voteCount += 1;
        voted[msg.sender] = true;
        emit Voted(msg.sender, proposalId);
    }

    function getVotes(uint proposalId) external view returns (uint) {
        return proposals[proposalId].voteCount;
    }
}
