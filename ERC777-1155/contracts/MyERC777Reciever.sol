// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v4.1/contracts/token/ERC777/ERC777.sol";

contract MyERC777Reciever is IERC777Recipient {

  mapping (address=>uint) public balances;
  ERC777 my_erc777;

  constructor (address my_erc777_address)
  {
    IERC1820Registry(0x1820a4B7618BdE71Dce8cdc73aAB6C95905faD24).
      setInterfaceImplementer(address(this),
        keccak256("ERC777TokensRecipient"),
        address(this)
      );
    my_erc777 = ERC777(my_erc777_address);
  }

  function tokensReceived(
      address operator,
      address from,
      address to,
      uint256 amount,
      bytes calldata userData,
      bytes calldata operatorData
    ) override external
  {
    // revert();
  }

  function deposit(uint amount) public
  {
    my_erc777.operatorSend(address(msg.sender), address(this), amount, "", "");
    balances[msg.sender] += amount;
  }

  function retrieveTokens() public
  {
    my_erc777.operatorSend(address(this), address(msg.sender), balances[msg.sender], "", "");
    balances[msg.sender] = 0;
  }
}