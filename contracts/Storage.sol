// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract Storage {
    //Map variable names to variable types
    mapping(string => uint256) _uintStorage;
    mapping(string => address) _addressStorage;
    mapping(string => bool) _boolStorage;
    mapping(string => string) _stringStorage;
    mapping(string => bytes4) _bytes4;

    address public owner;
    bool public _initialized;
}