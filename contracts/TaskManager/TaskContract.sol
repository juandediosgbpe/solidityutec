//SPDX-License-Identifier:MIT
pragma solidity >=0.4.2;

contract TaskContract {

    uint256 public TaskCounter = 0;

    constructor (){

    }

    event TaskCreated(
        uint256 id,
        string title,
        string description,
        bool done,
        uint256 createdAt
    );

    event TaskChangeStatus(uint256 id, bool done);

    struct Task {
        uint Id;
        string Title;    
        string Description;
        bool Done;
        uint256 createdAt;    
    }
    mapping (uint256 => Task) public Tasks;

    function createTask(string memory _title, string memory _description) public {
        TaskCounter++;
        Tasks[TaskCounter] = Task(TaskCounter, _title, _description, false, block.timestamp);        

        emit TaskCreated(TaskCounter, _title, _description, false, block.timestamp);
    }

    function changeStatus(uint256 _id) public {
        Task memory _task = Tasks[_id];
        _task.Done = !_task.Done;
        Tasks[_id] = _task;
        
        emit TaskChangeStatus(_id, _task.Done);
    }

}