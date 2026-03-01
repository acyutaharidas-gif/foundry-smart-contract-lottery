# 🎲 Provably Random Raffle Smart Contract

A decentralized, provably random lottery (raffle) smart contract built with Solidity and deployed on the **Sepolia Testnet**.

🔗 **Deployed Contract (Sepolia):**
[https://sepolia.etherscan.io/address/0xf8361daa040c8ecceebbffeb43b54fb9fb277990#code](https://sepolia.etherscan.io/address/0xf8361daa040c8ecceebbffeb43b54fb9fb277990#code)

---

## 📌 About The Project

This project implements a fully automated and provably random raffle system using:

* **Chainlink VRF (Verifiable Random Function)** for secure randomness
* **Chainlink Automation** for automated execution
* **Ethereum Sepolia Testnet** for deployment

The contract allows users to enter a raffle by paying a ticket fee. After a predefined time interval, a winner is automatically selected using verifiable randomness, and the entire prize pool is transferred to the winner.
---

## 🚀 Features

### ✅ 1. Enter the Raffle

* Users can enter by sending ETH equal to the ticket price.
* Each participant is stored in a players array.
* The collected ticket fees form the prize pool.

### ✅ 2. Automated Winner Selection

* The raffle automatically selects a winner after a fixed time interval.
* No manual trigger is required.

### ✅ 3. Provably Random Winner

* Uses **Chainlink VRF** to generate a secure, tamper-proof random number.
* Ensures fairness and transparency.

### ✅ 4. Fully Automated Execution

* **Chainlink Automation** monitors the contract.
* When conditions are met (time interval + players + balance), it automatically triggers the winner selection.
---

## 🛠 How It Works

### 1️⃣ Entering the Raffle

Users call the `enterRaffle()` function and send the required ticket fee.

```solidity
function enterRaffle() external payable
```

Requirements:

* Must send at least the entrance fee.
* Raffle must be open.
---

### 2️⃣ Automation Check

Chainlink Automation calls:

```solidity
function checkUpkeep() external view returns (bool upkeepNeeded, bytes memory)
```

Conditions:

* Time interval has passed
* Raffle is open
* Contract has ETH balance
* At least one player entered
---

### 3️⃣ Request Randomness

If upkeep is needed:

```solidity
function performUpkeep(bytes calldata) external
```

This requests a random number from Chainlink VRF.
---

### 4️⃣ Winner Selection

Chainlink VRF calls:

```solidity
function fulfillRandomWords(uint256 requestId, uint256[] memory randomWords) internal override
```

* A winner is chosen using modulo logic.
* The full contract balance is transferred to the winner.
* Raffle resets for the next round.
---

## 📦 Tech Stack

* Solidity
* Foundry
* Chainlink VRF
* Chainlink Automation
* Ethereum Sepolia Testnet
---

## 📍 Contract Details

* **Network:** Sepolia Testnet
* **Randomness Provider:** Chainlink VRF
* **Automation Provider:** Chainlink Automation
* **Prize:** 100% of collected ticket fees
---

## 🧪 How To Interact

1. Go to the deployed contract on Sepolia Etherscan.
2. Connect MetaMask (set to Sepolia).
3. Call `enterRaffle()` and send the entrance fee.
4. Wait for the automation interval to pass.
5. Winner is automatically selected.
