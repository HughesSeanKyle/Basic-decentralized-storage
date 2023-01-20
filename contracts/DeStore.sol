// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DecentralizedStorage {
    mapping(address => bool) private owners;
    mapping(address => bytes) private data;

    function addOwner(address _owner) public {
        require(
            msg.sender == msg.sender,
            "Only the contract deployer can add new owners."
        );
        owners[_owner] = true;
    }

    function removeOwner(address _owner) public {
        require(
            msg.sender == msg.sender,
            "Only the contract deployer can remove owners."
        );
        owners[_owner] = false;
    }

    function store(bytes memory _data) public {
        require(owners[msg.sender], "Sender is not an owner.");
        // Store the data
        data[msg.sender] = _data;
    }

    function retrieve() public view returns (bytes memory) {
        require(owners[msg.sender], "Sender is not an owner.");
        // Retrieve and return the data
        return data[msg.sender];
    }
}
