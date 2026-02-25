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

import {VRFConsumerBaseV2Plus} from "@chainlink/contracts/src/v0.8/vrf/dev/VRFConsumerBaseV2Plus.sol";
import {VRFV2PlusClient} from "@chainlink/contracts/src/v0.8/vrf/dev/libraries/VRFV2PlusClient.sol";

/**
 * @title A sample Raffle Contract
 * @author Acyuta
 * @notice This contract is for creating a sample raffle contract
 * @dev This implements the Chainlink VRF Version 2
 */

contract Raffle is VRFConsumerBaseV2Plus {
    /* Errors */
    error Raffle__NotEnoughETHSent();

    /* Variables */
    uint256 private immutable i_entranceFee;
    // @dev the duration of lottery in seconds
    uint256 private immutable i_interval;
    uint256 private s_lastTimeStamp;
    address payable[] private s_players;
    // uint256 private requestId;

    /* Events */
    event RaffleEntered(address indexed player);

    /* Constructor */
    constructor(
        uint256 entranceFee,
        uint256 interval,
        address vrfCoordinator
    ) VRFConsumerBaseV2Plus(vrfCoordinator) {
        i_entranceFee = entranceFee;
        i_interval = interval;
        s_lastTimeStamp = block.timestamp;
    }

    /* Receive Function */
    /* Fallback Function */

    /* External Functions */
    function enterRaffle() external payable {
        // require(msg.value >= i_entranceFee, "Not enough ETH sent");
        if (msg.value >= i_entranceFee) {
            revert Raffle__NotEnoughETHSent();
        }

        s_players.push(payable(msg.sender));
        // 1. Events emitted are not stored in smart contract hence no storage.
        // 2. Makes frontend indexing easier
        emit RaffleEntered(msg.sender);
    }

    /* Public Function */
    function pickWinner() external {
        if ((block.timestamp - s_lastTimeStamp) < i_interval) {
            revert();
        }

        VRFV2PlusClient.RandomWordsRequest requestId = VRFV2PlusClient
            .requestRandomWords({
                keyHash: keyHash,
                subId: s_subscriptionId,
                requestConfirmations: requestConfirmations,
                callbackGasLimit: callbackGasLimit,
                numWords: numWords,
                extraArgs: VRFV2PlusClient._argsToBytes(
                    VRFV2PlusClient.ExtraArgsV1({
                        nativePayment: enableNativePayment
                    })
                )
            });
    }

    /* Getter Functions */
    function getEntraceFee() external view returns (uint256) {
        return i_entranceFee;
    }
}
