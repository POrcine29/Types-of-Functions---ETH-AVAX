# Create and Mint Token

The process of creating new tokens on a blockchain network is called "token minting." Tokens are digital assets that can represent a wide range of values, such as virtual copies of real goods, utility tokens, and cryptocurrencies.

## Description

generating fresh tokens or digital money on a blockchain network. In order to validate transactions and add them to the blockchain ledger, it requires applying computer power to solve difficult mathematical problems. Every transaction is tracked by this decentralized, unchangeable ledger, which guarantees security and openness.

## Getting Started

### Executing program

Open your web browser and navigate to Remix IDE. 

https://remix.ethereum.org/

Click on the file icon in the File Explorer tab to create a new file and name it `MyToken.sol`.

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MyToken is ERC20 {
    address public owner; // Declare owner variable
    uint256 private _totalSupply;

    constructor() ERC20("Poliana", "PLN") {
        owner = msg.sender; // Assign the deployer of the contract as the owner
        _mint(msg.sender, 1000000 * 10 ** decimals()); // Mint 1,000,000 tokens initially
        _totalSupply = 1000000 * 10 ** decimals();
    }

    function mint(address _to, uint256 _amount) public returns (bool success) {
        require(msg.sender == owner, "Only the owner can mint tokens");
        
        _mint(_to, _amount);
        _totalSupply += _amount;
        return true;
    }

    function burn(uint256 _amount) public returns (bool success) {
        _burn(msg.sender, _amount);
        _totalSupply -= _amount;
        return true;
    }

    function transfer(address _to, uint256 _value) public override returns (bool success) {
        _transfer(msg.sender, _to, _value);
        return true;
    }
}
```

Copy and Paste: Copy the contract code you provided and paste it into the `MyToken.sol`.file in Remix.

Click on the "Compile" button in the compiler tab to compile the contract. You should see a green checkmark if it is successful.

Deploy the Contract: Click on the "Deploy" button. This will deploy the contract to the selected environment. You should see the deployed contract and copy and paste it the address below.

Once the contract is deployed, you can interact with it using the provided functions like mint, transfer,and burn. You can call these functions by filling in the required parameters and clicking on the respective buttons.

## Authors

Orcine,Poliana J.

8210778@ntc.edu.ph
