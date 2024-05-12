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
