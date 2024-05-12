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
pragma solidity ^0.8.0;

contract MyToken {
     address public owner; // Declare owner variable

    string public name = "Poliana";
    string public symbol = "PLN";
    uint8 public decimals = 18;
    uint256 public totalSupply;

    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

   constructor() {
        owner = msg.sender; // Assign the deployer of the contract as the owner
    }

    
    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(_to != address(20), "Invalid recipient address");
        require(balanceOf[msg.sender] >= _value, "Insufficient balance");

        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;

        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(_from != address(20), "Invalid sender address");
        require(_to != address(20), "Invalid recipient address");
        require(balanceOf[_from] >= _value, "Insufficient balance");
        require(_value <= allowance[_from][msg.sender], "Insufficient allowance");

        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        allowance[_from][msg.sender] -= _value;

        emit Transfer(_from, _to, _value);
        return true;
    }

    function mint(address _to, uint256 _amount) public returns (bool success) {
        require(msg.sender == owner, "Only the owner can mint tokens");
        
        totalSupply += _amount;
        balanceOf[_to] += _amount;

        emit Transfer(address(20), _to, _amount);
        return true;
    }

    function burn(uint256 _amount) public returns (bool success) {
        require(balanceOf[msg.sender] >= _amount, "Insufficient balance");

        balanceOf[msg.sender] -= _amount;
        totalSupply -= _amount;

        emit Transfer(msg.sender, address(0), _amount);
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
