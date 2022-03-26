// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

// We can take away a few things from this example.
// Mainly, if we wanted to, let's say, call the transfer function of an ERC-20 token.
// We would add the Interface to the file and be able to call the transfer function by
// Passing the address into the interface constructor. This essentially gives us the object
// without needing full access to the code. It gives us an abstraction of the functions.

contract TestContract {
    uint public x;
    uint public value = 123;

    function setX(uint _x) external {
        x = _x;
    }

    function getX() external view returns (uint) {
        return x;
    }

    function setXandReceiveEther(uint _x) external payable {
        x = _x;
        value = msg.value;
    }

    function getXandValue() external view returns (uint, uint) {
        return (x, value);
    }

    function setXtoValue() external payable {
        x = msg.value;
    }

    function getValue() external view returns (uint) {
        return value;
    }
}

contract CallTestContract {
    function setX(TestContract _test, uint _x) external {
        _test.setX(_x);
    }

    function setXfromAddress(address _addr, uint _x) external {
        TestContract test = TestContract(_addr);
        test.setX(_x);
    }

    function getX(address _addr) external view returns (uint) {
        uint x = TestContract(_addr).getX();
        return x;
    }

    function setXandSendEther(TestContract _test, uint _x) external payable {
        _test.setXandReceiveEther{value: msg.value}(_x);
    }

    function getXandValue(address _addr) external view returns (uint, uint) {
        (uint x, uint value) = TestContract(_addr).getXandValue();
        return (x, value);
    }

    function setXwithEther(address _addr) external payable {
        TestContract(_addr).setXtoValue{value: msg.value}();
    }

    function getValue(address _addr) external view returns (uint) {
        return TestContract(_addr).getValue();
    }
}