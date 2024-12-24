// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract CharityEvent {

    IERC20 public rewardToken; // The token that will be rewarded to participants
    address public eventOrganizer;
    uint256 public totalFundsRaised;

    // Mapping to track donations and token rewards
    mapping(address => uint256) public donorToAmount;
    mapping(address => uint256) public donorToRewardTokens;

    // Event to log donations and rewards
    event DonationReceived(address indexed donor, uint256 amount, uint256 tokensRewarded);
    event RewardClaimed(address indexed donor, uint256 tokensClaimed);

    // Constructor to initialize the reward token and event organizer
    constructor(address _rewardToken) {
        rewardToken = IERC20(_rewardToken);
        eventOrganizer = msg.sender;
    }

    // Function 1: Donate and earn tokens for charity
    function donateAndEarnTokens() external payable {
        require(msg.value > 0, "Donation must be greater than zero");

        // Track the donation amount
        donorToAmount[msg.sender] += msg.value;
        totalFundsRaised += msg.value;

        // Calculate the reward tokens based on the donation (1 Ether = 100 tokens)
        uint256 rewardTokens = msg.value * 100;

        // Track the reward tokens for the donor
        donorToRewardTokens[msg.sender] += rewardTokens;

        // Emit the donation event
        emit DonationReceived(msg.sender, msg.value, rewardTokens);
    }

    // Function 2: Claim tokens for the donation made
    function claimReward() external {
        uint256 rewardTokens = donorToRewardTokens[msg.sender];
        require(rewardTokens > 0, "No tokens to claim");

        // Reset the donor's reward token balance
        donorToRewardTokens[msg.sender] = 0;

        // Transfer the reward tokens to the donor
        require(rewardToken.transfer(msg.sender, rewardTokens), "Token transfer failed");

        // Emit the reward claim event
        emit RewardClaimed(msg.sender, rewardTokens);
    }
}
