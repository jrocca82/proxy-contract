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

    receive() payable external {
        //TODO: Implement function when receiving ether
    }

    fallback() payable external {
        address implementation = dogAddress;
        require(dogAddress != address(0));
        bytes memory data = msg.data;

        assembly {
            let result := delegatecall(gas(), implementation, add(data, 0x20), mload(data), 0, 0)
            let size := returndatasize()
            let ptr := mload(0x40)
            returndatacopy(ptr, 0, size)
            switch result
                case 0 {revert(ptr, size)}
                default {return(ptr, size)}
        }
    }
}