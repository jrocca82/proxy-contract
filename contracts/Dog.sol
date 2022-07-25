// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "./Storage.sol";

//Contract to be replaced
contract Dog is Storage {
    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner");
        _;
    }

    constructor () {
        owner = msg.sender;
    }

    function getNumberOfDogs() public view returns(uint256) {
        return _uintStorage["Dogs"];
    }

    function setNumberOfDogs(uint256 _numberOfDogs) public {
        _uintStorage["Dogs"] = _numberOfDogs;
    }
}