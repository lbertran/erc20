// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v4.1/contracts/token/ERC777/ERC777.sol";

contract MyERC777 is ERC777 {

    constructor() ERC777("MyToken", "MYT", new address[](0)) {
        _mint(msg.sender, 1000 ether, "", "");
    }

}



contract MyERC777 is ERC777 {

    constructor(uint256 initialSupply, address[] memory defaultOperators)
        ERC777("MyToken", "MYT", defaultOperators)
    {
        _mint(msg.sender, initialSupply, "", "");
    }
    
}
