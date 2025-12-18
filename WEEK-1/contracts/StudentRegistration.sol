// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentRegistration {
    struct Student { string name; uint256 roll; bool exists; }

    mapping(address => Student) public students;
    address public admin;

    event StudentRegistered(address indexed studentAddr, string name, uint256 roll);

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin");
        _;
    }

    function registerStudent(address studentAddr, string calldata name, uint256 roll) external onlyAdmin {
        require(!students[studentAddr].exists, "Already registered");
        students[studentAddr] = Student(name, roll, true);
        emit StudentRegistered(studentAddr, name, roll);
    }

    function getStudent(address studentAddr) external view returns (string memory, uint256, bool) {
        Student storage s = students[studentAddr];
        return (s.name, s.roll, s.exists);
    }
}
