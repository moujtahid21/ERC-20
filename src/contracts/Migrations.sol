pragma solidity ^0.8.11;

contract Migrations
{
    address public owner;
    uint public last_completed_migration;

    constructor() public    
    {
        owner = msg.sender;
    }
    modifier restricted()
    {
        if(msg.sender == owner) _;
    }
    function setComplete(uint completed) public restricted
    {
        last_completed_migration = completed;
    }
    function upgrade(address new_address) public restricted
    {
        Migrations upgraded = Migrations(new_address);
        upgraded.setComplete(last_completed_migration);
    }
} 
