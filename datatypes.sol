//SPDX-License-Identifier:MIT

pragma solidity ^0.8.20;

contract datatypes{

    //we have several data types in solidity
//e.g 
//int ,bool,uint ,address ,bytes
int x=12;  //int contains only positive numbers 
uint8 test=12;//both negative and positive numbers
uint16 tester=12;
uint256 testing=23;
bool istester=True;//(true or False)

address user=0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c;//eth address of a user in the evm compatible chain
//bytes is used to store raw data e.g cryptography keys/encoded values
bytes a =0x56;
}