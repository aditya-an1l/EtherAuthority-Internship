// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title Simple ERC20 Staking Contract
 * @author aditya-an1l
 * @notice This contract allows users to stake an ERC20 token and earn rewards in another ERC20 token.
 * @dev This implementation uses the Reward-Per-Token accumulator pattern (Synthetix style) 
 * to ensure O(1) complexity for reward calculations.
 */
contract Staking is ReentrancyGuard, Ownable {
    /// @notice The ERC20 token being staked by users
    IERC20 public immutable stakingToken;
    
    /// @notice The ERC20 token distributed as rewards
    IERC20 public immutable rewardToken;
    
    /// @notice The amount of reward tokens distributed per second across all stakers
    uint256 public rewardRatePerSecond;
    
    /// @notice The timestamp of the last reward state update
    uint256 public lastUpdateTime;
    
    /// @notice The accumulated reward per token (multiplied by 1e18 for precision)
    uint256 public rewardPerTokenStored;
    
    /// @notice Total amount of tokens currently staked in the contract
    uint256 public totalSupply;

    /// @notice Tracks the reward snapshot for each user to calculate delta earnings
    mapping(address => uint256) public userRewardPerTokenPaid;
    
    /// @notice Tracks the rewards earned by a user but not yet claimed
    mapping(address => uint256) public rewards;
    
    /// @notice Tracks the amount of staking tokens owned by each user
    mapping(address => uint256) public balanceOf;

    /// @dev Emitted when a user stakes tokens
    event Staked(address indexed user, uint256 amount);
    
    /// @dev Emitted when a user withdraws their staked tokens
    event Withdrawn(address indexed user, uint256 amount);
    
    /// @dev Emitted when a user claims their accumulated rewards
    event RewardPaid(address indexed user, uint256 reward);
    
    /// @dev Emitted when the owner updates the reward emission rate
    event RewardRateUpdated(uint256 newRate);

    /**
     * @notice Initializes the staking contract with token addresses and emission rate.
     * @param _stakingToken The address of the token to be staked.
     * @param _rewardToken The address of the token to be given as rewards.
     * @param _rewardRatePerSecond The initial amount of rewards distributed per second.
     */
    constructor(address _stakingToken, address _rewardToken, uint256 _rewardRatePerSecond) 
        Ownable(msg.sender) 
    {
        stakingToken = IERC20(_stakingToken);
        rewardToken = IERC20(_rewardToken);
        rewardRatePerSecond = _rewardRatePerSecond;
    }

    /**
     * @notice Calculates the total reward amount accumulated for a single token since the start.
     * @dev Uses 1e18 scaling to maintain precision during division.
     * @return The current accumulated reward per token.
     */
    function rewardPerToken() public view returns (uint256) {
        if (totalSupply == 0) {
            return rewardPerTokenStored;
        }
        return rewardPerTokenStored + (
            (block.timestamp - lastUpdateTime) * rewardRatePerSecond * 1e18 / totalSupply
        );
    }

    /**
     * @notice Calculates the total rewards a specific user has earned and can claim.
     * @param account The address of the user.
     * @return The amount of reward tokens earned.
     */
    function earned(address account) public view returns (uint256) {
        return (balanceOf[account] * (rewardPerToken() - userRewardPerTokenPaid[account]) / 1e18) + rewards[account];
    }

    /**
     * @dev Updates the global reward accumulator and the specific user's reward state.
     * This modifier is applied to any function that changes a user's balance or the total supply.
     * @param account The address of the user whose rewards are being updated.
     */
    modifier updateReward(address account) {
        rewardPerTokenStored = rewardPerToken();
        lastUpdateTime = block.timestamp;
        if (account != address(0)) {
            rewards[account] = earned(account);
            userRewardPerTokenPaid[account] = rewardPerTokenStored;
        }
        _;
    }

    /**
     * @notice Deposits tokens into the contract for staking.
     * @dev Requires an ERC20 approval from the user to the contract address.
     * @param amount The amount of tokens to stake.
     */
    function stake(uint256 amount) external nonReentrant updateReward(msg.sender) {
        require(amount > 0, "Cannot stake 0");
        totalSupply += amount;
        balanceOf[msg.sender] += amount;
        stakingToken.transferFrom(msg.sender, address(this), amount);
        emit Staked(msg.sender, amount);
    }

    /**
     * @notice Withdraws staked tokens back to the user's wallet.
     * @param amount The amount of tokens to withdraw.
     */
    function withdraw(uint256 amount) external nonReentrant updateReward(msg.sender) {
        require(amount > 0, "Cannot withdraw 0");
        require(balanceOf[msg.sender] >= amount, "Inadequate balance");
        totalSupply -= amount;
        balanceOf[msg.sender] -= amount;
        stakingToken.transfer(msg.sender, amount);
        emit Withdrawn(msg.sender, amount);
    }

    /**
     * @notice Transfers all earned reward tokens to the user.
     * @dev Clears the user's reward balance before transfer to prevent reentrancy issues.
     */
    function claimRewards() external nonReentrant updateReward(msg.sender) {
        uint256 reward = rewards[msg.sender];
        if (reward > 0) {
            rewards[msg.sender] = 0;
            rewardToken.transfer(msg.sender, reward);
            emit RewardPaid(msg.sender, reward);
        }
    }

    /**
     * @notice Updates the reward emission rate. Restricted to the contract owner.
     * @dev Triggers a global updateReward with address(0) to sync the accumulator before changing the rate.
     * @param _ratePerSecond The new amount of rewards to distribute per second.
     */
    function setRewardRate(uint256 _ratePerSecond) external onlyOwner updateReward(address(0)) {
        rewardRatePerSecond = _ratePerSecond;
        emit RewardRateUpdated(_ratePerSecond);
    }

    /**
     * @notice Helper function for front-ends to display pending rewards.
     * @param user The address of the staker.
     * @return The current pending reward balance.
     */
    function pendingReward(address user) external view returns (uint256) {
        return earned(user);
    }
}
