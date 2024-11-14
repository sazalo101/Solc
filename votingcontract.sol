//SPDX-License-Identifier:MIT

pragma solidity ^0.8.20;

contract voting{
    struct candidate{
        string name;
        string party;
        uint votes;
    }
candidate []public candidates;

mapping (address =>bool)public hasVoted;
 function voteNow(uint candidateIndex) public {
        require(candidateIndex < candidates.length, "Invalid candidate index");
       require(!hasVoted[msg.sender],"you haved voted");
        candidates[candidateIndex].votes += 1;
        hasVoted[msg.sender]=true;
    }
function setcandidate(string memory name,string memory party) public {
 
 candidates.push(candidate(name,party,0));

}
}
