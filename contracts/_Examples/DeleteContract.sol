// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

// When selfdestruct is called it forces the ETH to be sent
// to the recipient even if they don't have a fallback.

contract Kill {
    function kill() external {
        selfdestruct(payable(msg.sender));
    }
}
