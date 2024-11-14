//SPDX-License-Identifier:MIT

pragma solidity ^0.8.20;

contract send{
    event send{
        address indexed from,
        bytes32 indexed id,
        uint value
    }
function send(bytes32 id )public payable {
    emit send (msg.sender,id,msg.value)
}
}