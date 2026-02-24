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
 * @notice This contract is for creating a sample raffle contract
 * @dev This implements the Chainlink VRF Version 2
 */

contract Raffle {
    /* Errors */
    error Raffle__NotEnoughETHSent();
    
    /* Variables */
    uint256 private immutable i_entranceFee;

    /* Constructor */
    constructor(uint256 entranceFee) {
        i_entranceFee = entranceFee;
    }

    /* Receive Function */
    /* Fallback Function */

    /* External Functions */
    function enterRaffle() external payable {
        // require(msg.value >= i_entranceFee, "Not enough ETH sent");
        if(msg.value >= i_entranceFee){
            revert Raffle__NotEnoughETHSent();
        }
    }

    /* Public Function */
    function pickWinner() public {}

    /* Getter Functions */
    function getEntraceFee() external view returns (uint256) {
        return i_entranceFee;
    }
}