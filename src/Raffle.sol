// Layout of the contract file:
// version
// imports
// errors
// interfaces, libraries, contract
// Inside Contract:
// Type declarations
// State variables
// Events
// Modifiers
// Functions
// Layout of Functions:
// constructor
// receive function (if exists)
// fallback function (if exists)
// external
// public
// internal
// private
// view & pure functions

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title A sample Raffle Contract
 * @author Acyuta
 * @notice This contract is for creating a sample raffle
 * @dev It implements Chainlink VRFv2.5 and Chainlink Automation
 */

contract Raffle {
    uint256 private immutable i_entranceFee;

    constructor(uint256 entranceFee){
        i_entranceFee = entranceFee;
    }
    
    function enterRaffle() public payable {}
    
    function pickWinner() public {}

    /** Getter Functions */

    function getEntraceFee() external view returns(uint256) {
        return i_entranceFee;
    }
}