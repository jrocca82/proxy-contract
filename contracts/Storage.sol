// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract Storage {
    uint256 number;

    function getNumber() internal view returns(uint256){
        return number;
    }   

    function setNumber(uint256 _number) internal {
        number = _number;
    }
}