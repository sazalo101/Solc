//SPDX-License-Identifier:MIT

pragma solidity ^0.8.26;

contract statuss{
  
    enum Status{
        Pending,
        Approved,
        Rejected,
        Cancelled
    }

   Status public status;

function get()public view returns(Status)
{
    return status;
}
function set(Status _status)public{
    status=_status;
}
function cancel()public{
    status=Status.Cancelled;
}
function reset() public {
    delete status;
}
}