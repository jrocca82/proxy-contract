// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/access/Ownable.sol";

//NOT A FULL CONTRACT-- Showcases pausibility of contracts
contract PausibleBank is Ownable {
    mapping(address => uint256) balances;
    bool private _paused;

    constructor() {
        _paused = false;
    }

    modifier paused() {
        require(_paused);
        _;
    }

    modifier functional(){
        require(!_paused);
        _;
    }

    function withdrawAll() public functional{
        uint256 amountToWithdraw = balances[msg.sender];
        balances[msg.sender] = 0;
        payable(msg.sender).transfer(amountToWithdraw);
    }

    function pause() public onlyOwner functional{
        _paused = true;
    }

    function unpause() public onlyOwner paused{
        _paused = false;
    }

    function emergencyWithdrawal() public onlyOwner paused {
        //Implement emergency withdrawal function
    }
}