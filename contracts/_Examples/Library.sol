// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

library ArrayLib {
    function find(uint[] storage arr, uint x) internal view returns (uint) {
        for (uint i = 0; i < arr.length; i++) {
            if (arr[i] == x) {
                return i;
            }
        }
        revert("not found");
    }
    function sum(uint[] storage arr) internal view returns (uint) {
        uint sum = 0;
        for (uint i = 0; i < arr.length; i++) {
            sum += arr[i];
        }
        return sum;
    }
}

contract TestArray {
    using ArrayLib for uint[];

    uint[] public arr = [3, 2, 1];

    function testFind() external view {
        arr.find(2);
    }

    function testSum() external view returns (uint) {
        return arr.sum();
    }
}