// SPDX-License-Identifier: MIT
// by aditya-an1l

pragma solidity ^0.8.17;

contract AccountOwnership {
    mapping(address => bool) public hasAccount;
    mapping(address => string) public profile;

    event AccountCreated(address indexed user, string data);
    event ProfileUpdated(address indexed user, string data);

    function createAccount(string calldata _data) external {
        require(!hasAccount[msg.sender], "Account already exists");
        hasAccount[msg.sender] = true;
        profile[msg.sender] = _data;
        emit AccountCreated(msg.sender, _data);
    }

    function updateProfile(string calldata _data) external {
        require(hasAccount[msg.sender], "Create account first");
        profile[msg.sender] = _data;
        emit ProfileUpdated(msg.sender, _data);
    }

    function getProfile(address _user) external view returns (string memory) {
        return profile[_user];
    }
}
