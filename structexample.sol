//SPDX-License-Identifier:MIT
pragma solidity ^0.8.20;

contract structexample {
    struct user{
        string username;
        string bio;
        uint age;
    }
mapping(address=>user) users;
address []public user_users;


 function createuser() public {
     address userAddress= 0xDEE7796E89C82C36BAdd1375076f39D69FafE252;
 
    users[userAddress]=user("John","developer",20);

    user_users.push(userAddress);
    }

function getuserdetails()public view returns(address[] memory){
    return user_users;
}
function getuserbio(address userAddress)public view returns(string memory)
{
    return users[userAddress].username;
}

}
