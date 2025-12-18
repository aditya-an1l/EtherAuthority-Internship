// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InternshipTaskStatus {
    enum Status { NotStarted, InProgress, Done }

    struct Task {
        string title;
        string description;
        Status status;
        address updater;
    }

    mapping(uint => Task) public tasks;
    uint public taskCount;
    address public manager;

    event TaskCreated(uint indexed id, string title);
    event TaskUpdated(uint indexed id, Status status, address indexed updater);

    constructor() {
        manager = msg.sender;
    }

    function createTask(string calldata title, string calldata description) external {
        tasks[taskCount] = Task(title, description, Status.NotStarted, address(0));
        emit TaskCreated(taskCount, title);
        taskCount++;
    }

    function updateStatus(uint id, Status newStatus) external {
        require(id < taskCount, "Invalid task");
        Task storage t = tasks[id];
        t.status = newStatus;
        t.updater = msg.sender;
        emit TaskUpdated(id, newStatus, msg.sender);
    }

    function getTask(uint id) external view returns (string memory, string memory, Status, address) {
        Task storage t = tasks[id];
        return (t.title, t.description, t.status, t.updater);
    }
}
