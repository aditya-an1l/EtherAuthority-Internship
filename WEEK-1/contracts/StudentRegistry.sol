// SPDX-License-Identifier: MIT
// by aditya-an1l

pragma solidity ^0.8.17;

contract StudentRegistry {
    struct Student {
        string name;
        uint256 roll;
        string course;
        bool exists;
    }

    mapping(uint256 => Student) public students; // roll -> Student
    event StudentRegistered(uint256 roll, string name, string course);
    event StudentUpdated(uint256 roll, string name, string course);

    function register(uint256 _roll, string calldata _name, string calldata _course) external {
        require(!students[_roll].exists, "Roll already registered");
        students[_roll] = Student({name: _name, roll: _roll, course: _course, exists: true});
        emit StudentRegistered(_roll, _name, _course);
    }

    function update(uint256 _roll, string calldata _name, string calldata _course) external {
        require(students[_roll].exists, "Not registered");
        Student storage s = students[_roll];
        s.name = _name;
        s.course = _course;
        emit StudentUpdated(_roll, _name, _course);
    }

    function getStudent(uint256 _roll) external view returns (string memory, uint256, string memory) {
        require(students[_roll].exists, "Not registered");
        Student storage s = students[_roll];
        return (s.name, s.roll, s.course);
    }
}
