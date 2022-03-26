// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract EtherWallet {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }
    
    fallback() payable external {}
    receive() payable external {}
    
    modifier isOwner() {
        require(msg.sender == owner, "You aren't the owner");
        _;
    }
    
    function withdraw(uint _amount) external isOwner {
        (bool _result, bytes memory _data) = owner.call{value: _amount}("");
        require(_result, "Failed to send Ether");
    }
}
