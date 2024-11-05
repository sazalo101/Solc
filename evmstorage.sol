//we are going to learn how to store and retrieve data using inline assembly (yul)

//SPDX-License-Identifier:MIT

pragma solidity 0.8.20;

contract evmstorage{
    //all will be in bytes32 in assembly language
    //a slot is 32 bytes e.g 
    //slot 0
    uint256 public s_x;
    //slot 1
    uint256 public s_y;
    //slot 2
    uint256 public s_x;

  function set_sstore() public {
    assembly{
        sstore(0,111)// so in slot 0 which is s-x the data inserted is 111
        sstore(1,222)//same for slot 1 but value is 222
        sstore(2,333)//same value=333
    }
  }
  function set_sload() public view returns(uint256 x,uint256 y,uint256 z){
    assembly{
       x:=sload(0)//returns the values stored in the slots
       y:=sload(1)
       z:sload(2)
  }
  
  }
}