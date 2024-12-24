# Charity Event - Donate and Earn Tokens

## Overview

This project is a **Charity Event** platform built using **Ethereum Smart Contracts**. Participants can donate Ether to the event and receive **ERC-20 reward tokens** as a token of appreciation for their contribution. The contract manages donations, calculates reward tokens, and allows users to claim them later.

## Features

- **Donate Ether**: Users can donate Ether to the charity event and earn reward tokens.
- **Claim Tokens**: Users can claim their earned reward tokens based on the amount of Ether they donate.
- **Event Tracking**: Tracks total funds raised and the reward tokens earned by each participant.
- **ERC-20 Integration**: The reward tokens are managed by an **ERC-20 token contract**.

## Technologies

- **Ethereum Smart Contracts**: Written in Solidity for the Ethereum blockchain.
- **MetaMask**: Used for interacting with the Ethereum network.
- **Web3.js**: JavaScript library for connecting the frontend to the Ethereum blockchain.
- **ERC-20 Token**: The charity event rewards participants with ERC-20 tokens.

## Getting Started

Follow the instructions below to set up the project and run it locally.

### Prerequisites

1. **MetaMask** installed in your browser. MetaMask is a browser extension that allows users to interact with the Ethereum blockchain.
2. **Web3.js**: The frontend uses the Web3.js library to interact with the Ethereum network. Make sure MetaMask is properly connected to your local or test network.
3. **Ethereum Testnet/Mainnet**: The smart contract needs to be deployed on an Ethereum network (e.g., Rinkeby Testnet or Ethereum Mainnet).
4. **ERC-20 Token Contract**: You will need to deploy an ERC-20 token contract (for the reward token) before using this platform.

### Contract Deployment

To deploy the `CharityEvent` contract on the Ethereum network:

1. Compile and deploy the **CharityEvent** smart contract using a tool like **Remix IDE**, **Truffle**, or **Hardhat**.
2. The contract requires the **ERC-20 reward token contract address** to be passed during initialization. This will allow the CharityEvent contract to distribute reward tokens to donors.
3. After deployment, update the `contractAddress` in the frontend code with your deployed contract's address.

### Frontend Setup

1. **Clone the repository**:

```bash
git clone https://github.com/your-username/charity-event.git
cd charity-event
```

2. **Open the `index.html` file** in your browser.

3. **Modify the contract address**:
   In the frontend code (`index.html`), replace the `contractAddress` with the deployed contract address of your **CharityEvent** contract.

```javascript
const contractAddress = "YOUR_CONTRACT_ADDRESS"; // Replace with your contract's deployed address
```

4. **Connect MetaMask**:
   - Click on "Connect MetaMask" in the frontend to link your Ethereum wallet.
   - Ensure you're connected to the **Rinkeby Testnet** (or whichever network you deployed the contract on).
5. **Donate and Earn Tokens**:
   - Enter an amount to donate in Ether (e.g., 0.1 ETH) and click "Donate and Earn Tokens".
   - You'll donate the Ether and automatically earn reward tokens based on the amount donated (1 Ether = 100 reward tokens).
6. **Claim Reward Tokens**:
   - After donation, you can click "Claim Reward Tokens" to claim the ERC-20 tokens that you earned for your donation.

### Example of Frontend Code

The frontend is built using basic HTML, JavaScript, and the **Web3.js** library. Below is the basic flow:

- **Donation Flow**:
  - Users donate Ether via the `donateAndEarnTokens` function.
  - The contract tracks how much the user donates and awards reward tokens (100 tokens for each Ether donated).
  - The user can then claim their earned reward tokens via the `claimReward` function.

### Contract Functions

1. **donateAndEarnTokens**:
   - Accepts donations in Ether.
   - Calculates reward tokens (1 Ether = 100 tokens) and updates the donor's token balance.
   - Emits the `DonationReceived` event with details of the donation and reward tokens.
2. **claimReward**:
   - Allows the donor to claim the reward tokens earned from donations.
   - Transfers the reward tokens to the donor’s MetaMask account.

### Events

- **DonationReceived**: Logs when a donation is received and the reward tokens are calculated.
- **RewardClaimed**: Logs when a donor claims their earned reward tokens.

## Example Flow

1. **Donor Makes a Donation**:

   - A donor makes a donation of 1 Ether to the charity.
   - The donor earns 100 reward tokens.
   - The contract emits a `DonationReceived` event.

2. **Claim Reward Tokens**:
   - The donor can later claim their earned reward tokens.
   - The contract transfers the tokens to the donor’s wallet and emits a `RewardClaimed` event.

## Contributing

Feel free to fork this repository and submit pull requests for improvements. You can contribute in the following ways:

- Fixing bugs.
- Adding new features (e.g., additional token rewards, more detailed transaction logs, etc.).
- Improving the user interface or user experience.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

### Disclaimer

This project is for educational purposes only. If you're deploying it to a live network (mainnet), be aware that real funds are involved. Always test on a testnet (e.g., Rinkeby) before deploying on the Ethereum mainnet.

---

With this setup, you're able to create a **Charity Event** where donors can contribute Ether and receive ERC-20 tokens as rewards.
