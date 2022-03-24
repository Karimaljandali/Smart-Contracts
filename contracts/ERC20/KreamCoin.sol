//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

import "hardhat/console.sol";

contract KreamCoin is ERC20 {
    constructor(uint256 initialSupply) ERC20("KreamCoin", "KRM") {
        _mint(msg.sender, initialSupply);
    }
}