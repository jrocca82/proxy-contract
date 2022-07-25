// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "./Dog.sol";

contract DogsUpdated is Dog {

  constructor() {
    initialize(msg.sender);
  }

  function initialize(address _owner) public {
    require(!_initialized);
    owner = _owner;
    _initialized = true;
  }
}