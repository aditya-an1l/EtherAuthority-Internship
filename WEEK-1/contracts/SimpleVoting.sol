// SPDX-License-Identifier: MIT
// by aditya-an1l

pragma solidity ^0.8.17;

contract SimpleVoting {
    struct Candidate {
        string name;
        uint256 voteCount;
    }

    mapping(uint256 => Candidate) public candidates;
    uint256 public candidateCount;
    mapping(address => bool) public hasVoted;

    event CandidateAdded(uint256 id, string name);
    event Voted(address voter, uint256 candidateId);

    function addCandidate(string calldata _name) external {
        candidates[candidateCount] = Candidate({name: _name, voteCount: 0});
        emit CandidateAdded(candidateCount, _name);
        candidateCount++;
    }

    function vote(uint256 _candidateId) external {
        require(!hasVoted[msg.sender], "Already voted");
        require(_candidateId < candidateCount, "Invalid candidate");
        candidates[_candidateId].voteCount += 1;
        hasVoted[msg.sender] = true;
        emit Voted(msg.sender, _candidateId);
    }

    function getVotes(uint256 _candidateId) external view returns (uint256) {
        require(_candidateId < candidateCount, "Invalid candidate");
        return candidates[_candidateId].voteCount;
    }
}
