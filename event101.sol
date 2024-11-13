//SPDX-License-Identifier:MIT

pragma solidity ^0.8.20;

contract event101{
    uint256 public age;
    event Increment(address owner);

function getage(uint _a,uint _b) public {
    emit Increment(msg.sender);
    age=_a+_b;
}
}