//SPDX-License-Identifier:MIT

pragma solidity ^0.8.20;

contract followers
{
    struct user{
        string username;
        string bio;
        uint256 followers;
    }

user [] public users; 
    mapping(address=>bool) public hasfollowed;

    
    function adduser(string memory username,string memory bio) public{
    users.push(user(username,bio,0));
}

    function  followuser(uint256 userIndex) public{
    require(userIndex<users.length,"No user id has keyed");
    require(!hasfollowed[msg.sender],"You have followed the user");
     users[userIndex].followers +=1;
    
    hasfollowed[msg.sender]=true;
}
    
}