// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

// This contract contains three different methods to send Ether.
// transfer (forwards 2300 gas, throws error on failure)
// send (forwards 2300 gas, returns bool)
// call (forwards specified gas or defaults to all, returns bool and outputs in bytes)
contract SendEther {
    fallback() external payable {}
    
    function sendViaTransfer(address payable _to) external payable {
        // This function is no longer recommended for sending Ether.
        _to.transfer(msg.value);
    }

    function sendViaSend(address payable _to) external payable {
        // Send returns a boolean value indicating success or failure.
        // This function is not recommended for sending Ether.
        bool sent = _to.send(msg.value);
        require(sent, "Failed to send Ether");
    }

    function sendViaCall(address payable _to) external payable {
        // Call returns a boolean value indicating success or failure.
        // This is the current recommended method to use.
        (bool sent, bytes memory data) = _to.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
    }
}
