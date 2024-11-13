//SPDX-License-Identifier:MIT

pragma solidity ^0.8.26;

contract trading{
    event NewTrade(
        uint256 indexed date,
        address from,
        address indexed to,
        uint256 indexed amount
    );
function trade (address to,uint256 amount)external {
    emit NewTrade(block.timestamp,msg.sender, to, amount);
}
}

