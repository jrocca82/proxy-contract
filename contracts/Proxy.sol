// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "./Storage.sol";

//Contract that users call

contract Proxy is Storage {
    address public dogAddress;

    constructor(address _dogAddress) {
        dogAddress = _dogAddress;
    }

    function upgradeAddress(address _newDogAddress) public {
        dogAddress = _newDogAddress;
    }

    function getNumberOfDogs() public returns(bool, bytes memory) {
        (bool res, bytes memory data) = dogAddress.delegatecall(abi.encodePacked(bytes4(keccak256("getNumberOfDogs()"))));
        return (res, data);
    }

    function setNumberOfDogs(uint256 _number) public returns (bool, bytes memory) {
        (bool res, bytes memory data) = dogAddress.delegatecall(abi.encodePacked(bytes4(keccak256("setNumberOfDogs(uint256)")), _number));
        return (res, data);
    }
}