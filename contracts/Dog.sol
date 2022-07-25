// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "./Storage.sol";

//Contract to be replaced

contract Dog is Storage {
    function getNumberOfDogs() public view returns(uint256) {
        return Storage.getNumber();
    }

    function setNumberOfDogs(uint256 _numberOfDogs) public {
        //Introduce bug to fix in replacement contract
        Storage.setNumber(_numberOfDogs + 1);
    }
}